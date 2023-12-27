func.func private @printMemrefF64(memref<*xf64>)

func.func @hanning_window(%len : i32) -> tensor<?xf64>{
  %c1 = arith.constant 1 : i32
  %start = arith.subi %c1, %len : i32
  %step = arith.constant 2 : i32

  // generate tensor arange(1-%len, %len, 2)
  %len_index = arith.index_cast %len : i32 to index
  %t = tensor.generate %len_index {
    ^bb0(%i : index):
      %i_i32 = arith.index_cast %i : index to i32
      %steps = arith.muli %step, %i_i32 : i32
      %i32_elem  = arith.addi %start, %steps : i32
      %f64_elem = arith.sitofp %i32_elem : i32 to f64
      tensor.yield %f64_elem : f64
  } : tensor<?xf64>

  %pi_f64 = arith.constant 3.141592653589793 : f64 
  %t_pi = tensor.generate %len_index {
    ^bb0(%i : index):
      tensor.yield %pi_f64 : f64
  } : tensor<?xf64>

  %t_mul_pi = linalg.mul 
    ins(%t, %t_pi : tensor<?xf64>, tensor<?xf64>)
    outs(%t : tensor<?xf64>) -> tensor<?xf64>

  %c_i32 = arith.subi %len, %c1 : i32
  %c_f64 = arith.sitofp %c_i32 : i32 to f64
  %t_c = tensor.generate %len_index {
    ^bb0(%i : index):
      tensor.yield %c_f64 : f64
  } : tensor<?xf64>

  %t_div = linalg.div 
    ins(%t_mul_pi, %t_c : tensor<?xf64>, tensor<?xf64>)
    outs(%t : tensor<?xf64>) -> tensor<?xf64>

  %t_cos = math.cos %t_div : tensor<?xf64>

  %half_f64 = arith.constant 0.5 : f64
  %t_half = tensor.generate %len_index {
    ^bb0(%i : index):
      tensor.yield %half_f64 : f64
  } : tensor<?xf64>

  %t_mul_half = linalg.mul 
    ins(%t_cos, %t_half : tensor<?xf64>, tensor<?xf64>)
    outs(%t : tensor<?xf64>) -> tensor<?xf64>
  %t_res = linalg.add
    ins(%t_mul_half, %t_half : tensor<?xf64>, tensor<?xf64>)
    outs(%t : tensor<?xf64>) -> tensor<?xf64>
  // %t_div = arith.divf %t_mul_pi, %t_c : tensor<?xf64>
  // %t_cos = math.cos %t_div : tensor<?xf64>

  // %half_f64 = arith.constant 0.5 : f64
  // %t_half = tensor.generate %len_index {
  //   ^bb0(%i : index):
  //     tensor.yield %half_f64 : f64
  // } : tensor<?xf64>

  // %t_mul_half = arith.mulf %t_cos, %t_half : tensor<?xf64>
  // %t_res = arith.addf %t_mul_half, %t_half : tensor<?xf64>

  // calculate "0.5 + 0.5*cos(pi*%t/(%len-1))""  // TODO
  
  // %t_pi = arith.mulf %t, %pi : tensor<?xf64>

  // %c_i32 = arith.subi %len, %c1 : i32
  // %c_f64 = arith.sitofp %c_i32 : i32 to f64
  // %t_div = arith.divf %t_pi, %c_f64 : tensor<?xf64>

  // %t_cos = math.cos %t_div : tensor<?xf64>
  // %f_half = arith.constant 0.5 : f64
  // %t_mul = arith.mulf %t_cos, %f_half : tensor<?xf64>

  // %t_res = arith.addf %t_mul, %f_half : tensor<?xf64>

  return %t_res : tensor<?xf64>
}

func.func @main() {
  %c5 = arith.constant 8 : i32
  %t = func.call @hanning_window(%c5) : (i32) -> tensor<?xf64>
 
  %m = bufferization.to_memref %t : memref<?xf64>
  %print_out = memref.cast %m : memref<?xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}
