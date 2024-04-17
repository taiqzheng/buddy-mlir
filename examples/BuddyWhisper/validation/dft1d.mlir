func.func @indexToF32(%in : index) -> f32 {
  %i32Num = arith.index_cast %in : index to i32
  %f32Num = arith.sitofp %i32Num : i32 to f32
  return %f32Num : f32
}

func.func @f32ToIndex(%in : f32) -> index {
  %i32Num = arith.fptoui %in : f32 to i32
  %out = arith.index_cast %i32Num : i32 to index
  return %out : index
}

func.func @dft1d(%memRefReal : memref<?xf32>, %memRefImag : memref<?xf32>, %memRefLength : index, %strideVal : index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %f32MemRefLength = func.call @indexToF32(%memRefLength) : (index) -> f32
  %f32UpperBound = math.log2 %f32MemRefLength : f32
  %upperBound = func.call @f32ToIndex(%f32UpperBound) : (f32) -> index  
  %neg2MPI = arith.constant -6.283185307179586476925286766559 : f32

  %result:2 = scf.for %iv = %c0 to %upperBound step %c1 iter_args(%subProbs = %c1, %subProbSize = %memRefLength) -> (index, index) {
    %half = arith.shrsi %subProbSize, %c1 : index
    %f32SubProbSize = func.call @indexToF32(%subProbSize) : (index) -> f32
    %angle = arith.divf %neg2MPI, %f32SubProbSize : f32
    %wStepReal = math.cos %angle : f32
    %wStepRealVec = vector.broadcast %wStepReal : f32 to vector<1xf32>  // Add vector shape
    %wStepImag = math.sin %angle : f32
    %wStepImagVec = vector.broadcast %wStepImag : f32 to vector<1xf32>  // Add vector shape
    scf.for %iv1 = %c0 to %subProbs step %c1 {
      %jBegin = arith.muli %iv1, %subProbSize : index
      %jEnd = arith.addi %jBegin, %half : index
      %wReal = arith.constant 1.0 : f32
      %wImag = arith.constant 0.0 : f32
      %wRealVec = vector.broadcast %wReal : f32 to vector<1xf32>  // Add vector shape
      %wImagVec = vector.broadcast %wImag : f32 to vector<1xf32>  // Add vector shape
      scf.for %iv2 = %jBegin to %jEnd step %strideVal iter_args(%wVR0 = %wRealVec, %wVR1 = %wImagVec) -> (vector<1xf32>, vector<1xf32>) {
        %tmp1Real = vector.load %memRefReal[%iv2] : memref<?xf32>, vector<1xf32>  // Check vector.load op
        %tmp1Imag = vector.load %memRefImag[%iv2] : memref<?xf32>, vector<1xf32>

        %secondIndex = arith.addi %iv2, %half : index
        %tmp2Real = vector.load %memRefReal[%secondIndex] : memref<?xf32>, vector<1xf32>
        %tmp2Imag = vector.load %memRefImag[%secondIndex] : memref<?xf32>, vector<1xf32>

        // complexVecAddI
        %int1VecReal = arith.addf %tmp1Real, %tmp2Real : vector<1xf32>
        %int1VecImag = arith.addf %tmp1Imag, %tmp2Imag : vector<1xf32>
        vector.store %int1VecReal, %memRefReal[%iv2] : memref<?xf32>, vector<1xf32> // Add
        vector.store %int1VecImag, %memRefImag[%iv2] : memref<?xf32>, vector<1xf32> // Add

        // complexVecSubI
        %int2VecReal = arith.subf %tmp1Real, %tmp2Real : vector<1xf32>
        %int2VecImag = arith.subf %tmp1Imag, %tmp2Imag : vector<1xf32>
        // complexVecMulI
        %tmpInt1 = arith.mulf %int2VecReal, %wVR0 : vector<1xf32>
        %tmpInt2 = arith.mulf %int2VecImag, %wVR1 : vector<1xf32>
        %tmpInt3 = arith.mulf %int2VecReal, %wVR1 : vector<1xf32>
        %tmpInt4 = arith.mulf %int2VecImag, %wVR0 : vector<1xf32>
        %int3VecReal = arith.subf %tmpInt1, %tmpInt2 : vector<1xf32>
        %int3VecImag = arith.addf %tmpInt3, %tmpInt4 : vector<1xf32>

        vector.store %int3VecReal, %memRefReal[%secondIndex] : memref<?xf32>, vector<1xf32>
        vector.store %int3VecImag, %memRefImag[%secondIndex] : memref<?xf32>, vector<1xf32>

        // complexVecMulI
        %tmpInt5 = arith.mulf %wVR0, %wStepRealVec : vector<1xf32>
        %tmpInt6 = arith.mulf %wVR1, %wStepImagVec : vector<1xf32>
        %tmpInt7 = arith.mulf %wVR0, %wStepImagVec : vector<1xf32>
        %tmpInt8 = arith.mulf %wVR1, %wStepRealVec : vector<1xf32>
        %wUpdateReal = arith.subf %tmpInt5, %tmpInt6 : vector<1xf32>
        %wUpdateImag = arith.addf %tmpInt7, %tmpInt8 : vector<1xf32>

        scf.yield %wUpdateReal, %wUpdateImag : vector<1xf32>, vector<1xf32>  // Check 
      }
    }
    %updateSubProbs = arith.shli %subProbs, %c1 : index

    scf.yield %updateSubProbs, %half : index, index
  }
  return
}
