set(LLVM_MLIR_BINARY_DIR /root/buddy-mlir/llvm/build/bin)
set(BUDDY_OPT_TRIPLE x86_64-unknown-linux-gnu CACHE STRING "Target Triple.")
set(BUDDY_OPT_ATTR avx512f CACHE STRING "Target Architecture.")
set(BUDDY_MLIR_LIB_DIR /root/buddy-mlir/build/lib)

# Whisper Preprocessor
add_custom_command(OUTPUT whisper-preprocessor.o
  COMMAND /root/buddy-mlir/build/bin/buddy-opt
    /root/buddy-mlir/examples/BuddyWhisper/develop/whisperFeatureExtraction.mlir
        --tensor-bufferize  
        --linalg-bufferize 
        --tensor-bufferize
        --convert-linalg-to-loops
        --func-bufferize
        --arith-bufferize
        --convert-scf-to-cf
        --finalizing-bufferize
        --expand-strided-metadata
        --lower-affine
        --convert-vector-to-llvm --memref-expand -arith-expand
        --convert-arith-to-llvm
        --finalize-memref-to-llvm --convert-math-to-llvm
        --llvm-request-c-wrappers
        --convert-func-to-llvm
        --reconcile-unrealized-casts |
        ${LLVM_MLIR_BINARY_DIR}/mlir-translate -mlir-to-llvmir |
        ${LLVM_MLIR_BINARY_DIR}/llc -mtriple=${BUDDY_OPT_TRIPLE} 
            -mattr=${BUDDY_OPT_ATTR} -filetype=obj -relocation-model=pic
            -o ./whisper-preprocessor.o
  )
add_library(whisperPreprocessor STATIC whisper-preprocessor.o)
set_target_properties(whisperPreprocessor PROPERTIES LINKER_LANGUAGE CXX)

add_executable(run-whisper-preprocessor
  whisperPreprocessor.cpp
)

target_include_directories(run-whisper-preprocessor
  PRIVATE
  /root/buddy-mlir/frontend/Interfaces/
)

target_link_directories(run-whisper-preprocessor
  PRIVATE 
  ${BUDDY_MLIR_LIB_DIR}
  /root/buddy-mlir/build/lib/
  /root/buddy-mlir/llvm/build/lib/
)

target_link_libraries(run-whisper-preprocessor
  PRIVATE
  whisperPreprocessor
  mlir_c_runner_utils
)
