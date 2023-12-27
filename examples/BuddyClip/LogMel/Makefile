#!/bin/bash
BUDDY_OPT := ../../../build/bin/buddy-opt
MLIR_OPT := ../../../llvm/build/bin/mlir-opt
MLIR_CPU_RUNNER := ../../../llvm/build/bin/mlir-cpu-runner
OPT_FLAG := -O0

ifeq ($(shell uname),Linux)
MLIR_RUNNER_UTILS := ../../../llvm/build/lib/libmlir_runner_utils.so
MLIR_C_RUNNER_UTILS := ../../../llvm/build/lib/libmlir_c_runner_utils.so
else ifeq ($(shell uname),Darwin)
MLIR_RUNNER_UTILS := ../../../llvm/build/lib/libmlir_runner_utils.dylib
MLIR_C_RUNNER_UTILS := ../../../llvm/build/lib/libmlir_c_runner_utils.dylib
endif

log-mel-run:
	@${BUDDY_OPT} ./log-mel.mlir  \
		--tensor-bufferize --linalg-bufferize --tensor-bufferize -bufferization-bufferize \
		--func-bufferize \
		--arith-expand  \
		--convert-math-to-funcs \
		--convert-vector-to-scf \
		--convert-linalg-to-loops \
		--convert-scf-to-cf \
		--convert-cf-to-llvm \
		--finalizing-bufferize \
		--finalize-memref-to-llvm \
		--convert-arith-to-llvm \
		--convert-math-to-llvm \
		--convert-math-to-libm \
		--convert-vector-to-llvm \
		--convert-func-to-llvm \
		--reconcile-unrealized-casts 
# ${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
# -shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 
		
		
		
#log:		
# --arith-bufferize -tensor-bufferize -linalg-bufferize -func-bufferize \
# --tensor-bufferize \
# --memref-expand \
# --arith-expand \
# --finalizing-bufferize \
# --convert-vector-to-scf \
# --convert-linalg-to-loops \
# --convert-scf-to-cf \
# --convert-cf-to-llvm \
# --finalize-memref-to-llvm \
# --convert-arith-to-llvm \
# --convert-math-to-llvm \
# --convert-vector-to-llvm \
# --convert-func-to-llvm \
# --reconcile-unrealized-casts 
# ${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
# 	-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 

# --finalizing-bufferize \
