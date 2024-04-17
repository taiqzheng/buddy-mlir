memref.global "private" @inputMem : memref<4xf64> = dense<[1.0, 2.0, 3.0, 4.0]>
memref.global "private" @padMem : memref<2xindex> = dense<[3, 3]>

func.func private @printMemrefF64(memref<*xf64>)

func.func @padReflect(%array : tensor<?xf64>, %padWidth : tensor<2xindex>) -> tensor<?xf64>{  
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %before = tensor.extract %padWidth[%c0] : tensor<2xindex>
  %after = tensor.extract %padWidth[%c1] : tensor<2xindex>

  %arrayPadLow = tensor.pad %array low[%before] high[0] {
  ^bb0(%i : index):
    %index = arith.subi %before, %i : index
    %elem = tensor.extract %array[%index] : tensor<?xf64>
    tensor.yield %elem : f64
  } : tensor<?xf64> to tensor<?xf64>

  %arrayPadLowSize = tensor.dim %arrayPadLow, %c0 : tensor<?xf64>
  %symIndex = arith.subi %arrayPadLowSize, %c1 : index
  %result = tensor.pad %arrayPadLow low[0] high[%after] {
  ^bb0(%i : index):
    %sub = arith.subi %i, %symIndex : index
    %index = arith.subi %symIndex, %sub : index
    %elem = tensor.extract %arrayPadLow[%index] : tensor<?xf64>

    tensor.yield %elem : f64
  } : tensor<?xf64> to tensor<?xf64>

  return %result : tensor<?xf64>
}

func.func @main() {
  %input = memref.get_global @inputMem : memref<4xf64>
  %in = bufferization.to_tensor %input : memref<4xf64>
  %in1 = tensor.cast %in : tensor<4xf64> to tensor<?xf64>

  %pad = memref.get_global @padMem : memref<2xindex>
  %len = bufferization.to_tensor %pad : memref<2xindex>

  %t = func.call @padReflect(%in1, %len) : (tensor<?xf64>, tensor<2xindex>) -> tensor<?xf64>

  %m = bufferization.to_memref %t : memref<?xf64>
  %print_out = memref.cast %m : memref<?xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}