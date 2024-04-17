memref.global "private" @mem : memref<1xf64> = dense<[0.0]>

func.func private @printMemrefF64(memref<*xf64>)

func.func @hertz2mel(%freq : f64) -> f64 {
  %min_log_hertz = arith.constant 1000.0 : f64
  %min_log_mel = arith.constant 15.0 : f64
  
  %cond1 = arith.cmpf oge, %freq, %min_log_hertz : f64
  %result = scf.if %cond1 -> f64 {
    %tmp = arith.divf %freq, %min_log_hertz : f64
    %log = math.log %tmp : f64

    %f6_4 = arith.constant 6.4 : f64
    %f27 = arith.constant 27.0 : f64
    %log1 = math.log %f6_4 : f64  
    %logstep = arith.divf %f27, %log1 : f64 

    %rhs = arith.mulf %log, %logstep : f64
    %mels = arith.addf %min_log_mel, %rhs : f64
    scf.yield %mels : f64
  } else {
    %f3 = arith.constant 3.0 : f64
    %f200 = arith.constant 200.0 : f64
    %tmp = arith.mulf %f3, %freq : f64
    %mels = arith.divf %tmp, %f200 : f64 
    scf.yield %mels : f64
  }

  return %result : f64
}

func.func @main() {
  %m = memref.get_global @mem : memref<1xf64>
  %freq = arith.constant 200.0 : f64
  %t = func.call @hertz2mel(%freq) : (f64) -> f64
  %c0 = arith.constant 0 : index
  memref.store %t, %m[%c0] : memref<1xf64>

  %print_out = memref.cast %m : memref<1xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()

  return
}
