func.func private @printMemrefF64(memref<*xf64>)

#m2h_trait = {
  doc = "mels2hertz trait for tensor",
  indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>],
  iterator_types = ["parallel"]
}

func.func @mel2hertz(%mels : tensor<?xf64>) -> tensor<?xf64> {
  %min_log_hertz = arith.constant 1000.0 : f64
  %min_log_mel = arith.constant 15.0 : f64
  %f6_4 = arith.constant 6.4 : f64
  %f27 = arith.constant 27.0 : f64
  %f3 = arith.constant 3.0 : f64
  %f200 = arith.constant 200.0 : f64
  %log6_4 = math.log %f6_4 : f64
  %logstep = arith.divf %log6_4, %f27 : f64    

  %result = linalg.generic #m2h_trait
    ins(%mels : tensor<?xf64>)
    outs(%mels : tensor<?xf64>){
    ^bb0(%mel : f64, %b : f64):
      %cond1 = arith.cmpf oge, %mel, %min_log_mel : f64
      %elem = scf.if %cond1 -> f64 {
        %sub = arith.subf %mel, %min_log_mel : f64
        %mul = arith.mulf %logstep, %sub : f64
        %rhs = math.exp %mul : f64
        %elem = arith.mulf %min_log_hertz, %rhs : f64
        scf.yield %elem : f64
      } else {
        %mul = arith.mulf %mel, %f200 : f64
        %elem = arith.divf %mul, %f3 : f64
        scf.yield %elem : f64
      }
      linalg.yield %elem : f64
  } -> tensor<?xf64>

  return %result : tensor<?xf64>
}

func.func @main() {
  %freq = arith.constant 200.0 : f64
  %t = func.call @mel2hertz(%freq) : (f64) -> f64
  %c0 = arith.constant 0 : index

  %print_out = memref.cast %m : memref<1xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}
