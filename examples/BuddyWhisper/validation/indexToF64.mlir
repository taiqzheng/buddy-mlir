memref.global "private" @f64Mem : memref<1xf64> = dense<[0.0]>
memref.global "private" @indexMem : memref<1xindex> = dense<[0]>

func.func private @printMemrefF64(memref<*xf64>)

func.func @indexToF64(%in : index) -> f64 {
  %i64Num = arith.index_cast %in : index to i64
  %f64Num = arith.sitofp %i64Num : i64 to f64
  return %f64Num : f64
}

func.func @f64ToIndex(%in : f64) -> index {
  %i64Num = arith.fptoui %in : f64 to i64
  %out = arith.index_cast %i64Num : i64 to index
  return %out : index
}

func.func @main() {
  %c0 = arith.constant 0 : index
  %f64M = memref.get_global @f64Mem : memref<1xf64>
  %in1 = arith.constant 1 : index
  %out1 = func.call @indexToF64(%in1) : (index) -> f64
  memref.store %out1, %f64M[%c0] : memref<1xf64>
  %print_out = memref.cast %f64M : memref<1xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()
  
  return
}