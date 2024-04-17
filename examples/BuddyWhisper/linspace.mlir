memref.global "private" @mem : memref<1xf64> = dense<[0.0]>

func.func private @printMemrefF64(memref<*xf64>)

func.func @linspace(%start : f64, %end : f64, %num : i64) -> tensor<?xf64> {
  %delta = arith.subf %end, %start : f64
  %i1 = arith.constant 1 : i64
  %sections = arith.subi %num, %i1 : i64
  %f64_sections = arith.sitofp %sections : i64 to f64 
  %step = arith.divf %delta, %f64_sections : f64

  %len_index = arith.index_cast %num : i64 to index
  %t = tensor.generate %len_index {
    ^bb0(%i : index):
      %i_i64 = arith.index_cast %i : index to i64
      %i_f64 = arith.sitofp %i_i64 : i64 to f64
      %steps = arith.mulf %i_f64, %step : f64
      %elem = arith.addf %start, %steps : f64
      tensor.yield %elem : f64
  } : tensor<?xf64>

//   %res:2 = affine.for %j = 0 to %len_index iter_args(%in = %start, %tensor = %t) -> (f64, tensor<?xf64>) {
//     %t_next = tensor.insert %in into %tensor[%j] : tensor<?xf64>
//     %in_next = arith.addf %in, %step : f64
//     affine.yield %in_next, %t_next : f64, tensor<?xf64>
//   } 
  
  return %t : tensor<?xf64>
}

func.func @main() {
  %start = arith.constant 0.0 : f64
  %end = arith.constant 200.0 : f64
  %num = arith.constant 5 : i64
  %t = func.call @linspace(%start, %end, %num) : (f64, f64, i64) -> tensor<?xf64>

  %m = bufferization.to_memref %t : memref<?xf64>
  %print_out = memref.cast %m : memref<?xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}
