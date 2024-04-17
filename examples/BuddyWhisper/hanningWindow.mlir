func.func private @printMemrefF32(memref<*xf32>)

#cos_trait = {
  doc = "tensor trait for math.cos operation",
  indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>],
  iterator_types = ["parallel"]
}

func.func @hanning_window(%len : i32) -> tensor<?xf32>{
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
      %f64_elem = arith.sitofp %i32_elem : i32 to f32
      tensor.yield %f64_elem : f32
  } : tensor<?xf32>

  %pi_f64 = arith.constant 3.141592653589793 : f32
  %t_pi = tensor.generate %len_index {
    ^bb0(%i : index):
      tensor.yield %pi_f64 : f32
  } : tensor<?xf32>

  %t_mul_pi = linalg.mul 
    ins(%t, %t_pi : tensor<?xf32>, tensor<?xf32>)
    outs(%t : tensor<?xf32>) -> tensor<?xf32>

  %c_i32 = arith.subi %len, %c1 : i32
  %c_f64 = arith.sitofp %c_i32 : i32 to f32
  %t_c = tensor.generate %len_index {
    ^bb0(%i : index):
      tensor.yield %c_f64 : f32
  } : tensor<?xf32>

  %t_div = linalg.div 
    ins(%t_mul_pi, %t_c : tensor<?xf32>, tensor<?xf32>)
    outs(%t : tensor<?xf32>) -> tensor<?xf32>

  %t_cos = linalg.generic #cos_trait 
    ins(%t_div : tensor<?xf32>)
    outs(%t : tensor<?xf32>) {
    ^bb0(%a : f32, %b : f32):
      %elem = math.cos %a : f32
      linalg.yield %elem : f32
  } -> tensor<?xf32>

  %half_f64 = arith.constant 0.5 : f32
  %t_half = tensor.generate %len_index {
    ^bb0(%i : index):
      tensor.yield %half_f64 : f32
  } : tensor<?xf32>

  %t_mul_half = linalg.mul 
    ins(%t_cos, %t_half : tensor<?xf32>, tensor<?xf32>)
    outs(%t : tensor<?xf32>) -> tensor<?xf32>
  %t_res = linalg.add
    ins(%t_mul_half, %t_half : tensor<?xf32>, tensor<?xf32>)
    outs(%t : tensor<?xf32>) -> tensor<?xf32>

  return %t_res : tensor<?xf32>
}

func.func @main() {
  %c5 = arith.constant 400 : i32
  %t = func.call @hanning_window(%c5) : (i32) -> tensor<?xf32>

  %m = bufferization.to_memref %t : memref<?xf32>
  %print_out = memref.cast %m : memref<?xf32> to memref<*xf32>
  func.call @printMemrefF32(%print_out) : (memref<*xf32>) -> ()

  return
}