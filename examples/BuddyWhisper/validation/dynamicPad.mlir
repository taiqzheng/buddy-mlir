func.func @dynamicPad(%batched_speech : memref<?xf32>) -> memref<48xf32>{
  %input = bufferization.to_tensor %batched_speech : memref<?xf32>
  %maxLength = arith.constant 48 : i64

  %c0 = arith.constant 0.0 : f32
  %i1 = arith.constant 1 : index
  %size = tensor.dim %input, %i1 : tensor<?xf32>
  %i48 = arith.constant 48 : index
  %difference = arith.subi %i48, %size : index
  %padded = tensor.pad %input low[0] high[%difference] {
  ^bb0(%i : index):
    tensor.yield %c0 : f32
  } : tensor<?xf32> to tensor<48xf32>

  %result = bufferization.to_memref %padded : memref<48xf32>
  return %result : memref<48xf32>
}

