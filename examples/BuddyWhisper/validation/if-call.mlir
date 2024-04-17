func.func private @printMemrefF64(memref<*xf64>)

func.func @func1() -> tensor<1xf64> {
  %c3 = arith.constant 3.0 : f64
  %t = tensor.splat %c3 : tensor<1xf64>
  return %t : tensor<1xf64>
}

func.func @func2() -> tensor<1xf64> {
  %c7 = arith.constant 7.0 : f64
  %t = tensor.splat %c7 : tensor<1xf64>
  return %t : tensor<1xf64>
}

func.func @scfIf(%condition : i1) -> tensor<1xf64> {
  %result = scf.if %condition -> tensor<1xf64> {
    %t = func.call @func1() : () -> tensor<1xf64>
    scf.yield %t : tensor<1xf64>
  } else {
    %t = func.call @func2() : () -> tensor<1xf64>
    scf.yield %t : tensor<1xf64>
  }

  return %result : tensor<1xf64>
}

func.func @main() {
  %condition = arith.constant 1 : i1
  %t = func.call @scfIf(%condition) : (i1) -> tensor<1xf64>

  %m = bufferization.to_memref %t : memref<1xf64>
  %print_out = memref.cast %m : memref<1xf64> to memref<*xf64>
  func.call @printMemrefF64(%print_out) : (memref<*xf64>) -> ()
  return
}
