func.func @padToMaxLen(%batched_speech : tensor<?xf32>) -> tensor<480000xf32>{
  // %padding = "max_length"
  // %PaddingStrategy.MAX_LENGTH
  // %batch_size = 1
  // %padding_side = "right"
  // %self.padding_value = 0.0
  // self.feature_size 80
  // padding_shape ((0, 386320), (0, 0))
  %maxLength = arith.constant 480000 : i64
  %truncation = arith.constant 1 : index // true
  %padToMultiple = arith.constant 0 : index // false
  %returnAttentionMask = arith.constant 0 : index // false
  %returnTensors = arith.constant 0 : index // false, change to np in self.pad()
  
  // scf.if %condition {  // if %batched_speech length > %max_length, truncate to max_length
  //   func.call @truncate() : () -> ()
  // }

  %c0 = arith.constant 0.0 : f32
  %i1 = arith.constant 1 : index
  %size = tensor.dim %batched_speech, %i1 : tensor<?xf32>
  %i480000 = arith.constant 480000 : index
  %difference = arith.subi %i480000, %size : index
  %result = tensor.pad %batched_speech low[0] high[%difference] {
  ^bb0(%i : index):
    tensor.yield %c0 : f32
  } : tensor<?xf32> to tensor<480000xf32>

  return %result : tensor<480000xf32>
}