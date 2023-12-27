add_custom_command(
  OUTPUT ${BUDDY_EXAMPLES_DIR}/BuddyClip/clip.mlir ${BUDDY_EXAMPLES_DIR}/BuddyClip/arg0.data
  COMMAND ${Python3_EXECUTABLE} ${BUDDY_EXAMPLES_DIR}/BuddyClip/import-clip.py
  COMMENT "Generating clip.mlir and arg0.data..."
)

add_custom_command(
  OUTPUT clip.o
  COMMAND ${LLVM_MLIR_BINARY_DIR}/mlir-opt ${BUDDY_EXAMPLES_DIR}/BuddyClip/clip.mlir 
            -pass-pipeline "builtin.module(func.func(tosa-to-linalg-named),func.func(tosa-to-linalg),func.func(tosa-to-tensor),func.func(tosa-to-arith))" |
          ${BUDDY_BINARY_DIR}/buddy-opt
            -arith-expand
            -eliminate-empty-tensors
            -empty-tensor-to-alloc-tensor
            -linalg-bufferize
            -matmul-paralell-vectorization-optimize
            -batchmatmul-optimize
            -convert-linalg-to-affine-loops
            -affine-loop-fusion
            -affine-parallelize
            -lower-affine
            -convert-scf-to-openmp
            -func-bufferize
            -arith-bufferize
            -tensor-bufferize
            -buffer-deallocation
            -finalizing-bufferize
            -convert-vector-to-scf
            -expand-strided-metadata
            -convert-vector-to-llvm
            -memref-expand
            -arith-expand
            -convert-arith-to-llvm
            -finalize-memref-to-llvm
            -convert-scf-to-cf
            -llvm-request-c-wrappers
            -convert-openmp-to-llvm
            -convert-arith-to-llvm
            -convert-math-to-llvm
            -convert-math-to-libm 
            -convert-func-to-llvm
            -reconcile-unrealized-casts |
        ${LLVM_MLIR_BINARY_DIR}/mlir-translate -mlir-to-llvmir |
        ${LLVM_MLIR_BINARY_DIR}/llvm-as |
        ${LLVM_MLIR_BINARY_DIR}/llc -filetype=obj -relocation-model=pic -O3
          -o ${BUDDY_BINARY_DIR}/../examples/BuddyClip/clip.o
  DEPENDS buddy-opt ${BUDDY_EXAMPLES_DIR}/BuddyClip/clip.mlir
  COMMENT "Building clip.o "
  VERBATIM)

add_library(CLIP STATIC clip.o)

SET_SOURCE_FILES_PROPERTIES(
  template.o
  PROPERTIES
  EXTERNAL_OBJECT true
  GENERATED true)

SET_TARGET_PROPERTIES(
  CLIP
  PROPERTIES
  LINKER_LANGUAGE C)

add_executable(buddy-clip-run clip-main.cpp)
target_link_directories(buddy-clip-run PRIVATE ${LLVM_MLIR_LIBRARY_DIR})

set(BUDDY_CLIP_LIBS
  CLIP
  mlir_c_runner_utils
  omp
)
if(BUDDY_MLIR_USE_MIMALLOC)
  list(APPEND BUDDY_CLIP_LIBS mimalloc)
endif()

target_link_libraries(buddy-clip-run ${BUDDY_CLIP_LIBS})
