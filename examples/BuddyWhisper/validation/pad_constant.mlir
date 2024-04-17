func.func private @printMemrefF64(memref<*xf64>)

func.func @pad(%array : tensor<4xf64>, %before : index, %after : index) -> tensor<10xf64>{
  %c0 = arith.constant 0.0 : f64
  %c1 = arith.constant 1.0 : f64


  // it is okay to compute data in basic block in tensor.pad func.
  %arrayPadLow = tensor.pad %array low[%before] high[%after] {
  ^bb0(%i : index):
    %i64Num = arith.index_cast %i : index to i64
    %f64Num = arith.sitofp %i64Num : i64 to f64
    %elem = arith.addf %c0, %f64Num : f64
    tensor.yield %elem : f64
  } : tensor<4xf64> to tensor<10xf64>

  return %arrayPadLow : tensor<10xf64>
}

func.func @main() {
  %array = arith.constant dense<[1., 2., 3., 4.]> : tensor<4xf64>
  %before = arith.constant 3 : index
  %after = arith.constant 3 : index
  %t = func.call @pad(%array, %before, %after) : (tensor<4xf64>, index, index) -> tensor<10xf64>

  %m = bufferization.to_memref %t : memref<10xf64>
  %print_out = memref.cast %m : memref<10xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}