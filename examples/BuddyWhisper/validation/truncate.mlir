func.func @truncate(%data : tensor<?xf32> ,%truncateLength : index) -> tensor<?xf32> {
  %result = tensor.extract_slice %data[0][%truncateLength][1] : tensor<?xf32> to tensor<?xf32>
  return %result : tensor<?xf32>
}


func.func @main(){
  
}