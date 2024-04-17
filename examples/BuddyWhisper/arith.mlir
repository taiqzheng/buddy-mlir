func.func private @printMemrefF64(memref<*xf64>)

func.func @pad(%array : tensor<4xf64>, %padWidth : tensor<2xi32>) -> tensor<4xf64>{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %before = tensor.extract %padWidth[%c0] : tensor<2xi32>
  %after = tensor.extract %padWidth[%c1] : tensor<2xi32>

  return %array : tensor<4xf64>
}

func.func @main() {
  %0 = arith.constant dense<[1., 2., 3., 4.]> : tensor<4xf64>
  %padWidth = arith.constant dense<[2, 2]> : tensor<2xi32>
  %array = tensor.cast %0 : tensor<4xf64> to tensor<?xf64>
  %t = func.call @pad(%0, %padWidth) : (tensor<4xf64>, tensor<2xi32>) -> tensor<4xf64>

  %m = bufferization.to_memref %t : memref<4xf64>
  %print_out = memref.cast %m : memref<4xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}