func.func @example() -> (tensor<4xf64>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %f0 = arith.constant 0.000000e+00 : f64

    %num = arith.constant dense<[37.62, 15.43, -2.401]> : tensor<3xf64>
    %index = arith.constant dense<[0, 2, 4]> : tensor<3xindex>

    %splat = tensor.splat %f0 : tensor<4xf64>
    %newTensor = scf.for %iv = %c0 to %c3 step %c1 
        iter_args(%tmpTensor = %splat) -> (tensor<4xf64>){
        %scalar = tensor.extract %num[%iv] : tensor<3xf64>
        %idx = tensor.extract %index[%iv] : tensor<3xindex>
        %nextTensor = tensor.insert %scalar into %tmpTensor[%idx] : tensor<4xf64>
        scf.yield %nextTensor : tensor<4xf64>
    }
    return %newTensor : tensor<4xf64>
}

