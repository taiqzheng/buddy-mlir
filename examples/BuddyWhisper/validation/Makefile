#!/bin/bash
BUDDY_OPT := ../../../build/bin/buddy-opt
MLIR_OPT := ../../../llvm/build/bin/mlir-opt
MLIR_CPU_RUNNER := ../../../llvm/build/bin/mlir-cpu-runner
MLIR_TRANSLATE := ../../../llvm/build/bin/mlir-translate
LLC := ../../../llvm/build/bin/llc
OPT_FLAG := -O0

ifeq ($(shell uname),Linux)
MLIR_RUNNER_UTILS := ../../../llvm/build/lib/libmlir_runner_utils.so
MLIR_C_RUNNER_UTILS := ../../../llvm/build/lib/libmlir_c_runner_utils.so
MTRIPLE := x86_64-unknown-linux-gnu
BUDDY_OPT_ATTR := avx512f
else ifeq ($(shell uname),Darwin)
MLIR_RUNNER_UTILS := ../../../llvm/build/lib/libmlir_runner_utils.dylib
MLIR_C_RUNNER_UTILS := ../../../llvm/build/lib/libmlir_c_runner_utils.dylib
MTRIPLE := x86_64-apple-darwin
endif

indexToF64:
	@${BUDDY_OPT} ./indexToF64.mlir  \
		-one-shot-bufferize=bufferize-function-boundaries \
		-arith-expand  \
		-convert-math-to-funcs \
		-convert-vector-to-scf \
		-convert-linalg-to-loops \
		-convert-scf-to-cf \
		-convert-cf-to-llvm \
		-finalize-memref-to-llvm \
		-convert-arith-to-llvm \
		-convert-math-to-llvm \
		-convert-math-to-libm \
		-convert-vector-to-llvm \
		-convert-func-to-llvm \
		-reconcile-unrealized-casts | \
		${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 

h2m-run:
	@${BUDDY_OPT} ./hertz2mel.mlir  \
		-one-shot-bufferize=bufferize-function-boundaries \
		-arith-expand  \
		-convert-math-to-funcs \
		-convert-vector-to-scf \
		-convert-linalg-to-loops \
		-convert-scf-to-cf \
		-convert-cf-to-llvm \
		-finalize-memref-to-llvm \
		-convert-arith-to-llvm \
		-convert-math-to-llvm \
		-convert-math-to-libm \
		-convert-vector-to-llvm \
		-convert-func-to-llvm \
		-reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 

run-radf5:
	@${BUDDY_OPT} ./radf5.mlir  \
		-one-shot-bufferize=bufferize-function-boundaries \
		-arith-expand  \
		-convert-math-to-funcs \
		-convert-vector-to-scf \
		-convert-linalg-to-loops \
		-convert-scf-to-cf \
		-convert-cf-to-llvm \
		-finalize-memref-to-llvm \
		-convert-arith-to-llvm \
		-convert-math-to-llvm \
		-convert-math-to-libm \
		-convert-vector-to-llvm \
		-convert-func-to-llvm \
		-reconcile-unrealized-casts | \
		${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 

run-radf4:
	@${BUDDY_OPT} ./radf4.mlir  \
		-one-shot-bufferize=bufferize-function-boundaries \
		-arith-expand  \
		-convert-math-to-funcs \
		-convert-vector-to-scf \
		-convert-linalg-to-loops \
		-convert-scf-to-cf \
		-convert-cf-to-llvm \
		-finalize-memref-to-llvm \
		-convert-arith-to-llvm \
		-convert-math-to-llvm \
		-convert-math-to-libm \
		-convert-vector-to-llvm \
		-convert-func-to-llvm \
		-reconcile-unrealized-casts | \
		${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 

run-rfft400:
	@${BUDDY_OPT} ./rfft400.mlir  \
		-one-shot-bufferize=bufferize-function-boundaries \
		-arith-expand  \
		-convert-math-to-funcs \
		-convert-vector-to-scf \
		-convert-linalg-to-loops \
		-convert-scf-to-cf \
		-convert-cf-to-llvm \
		-finalize-memref-to-llvm \
		-convert-arith-to-llvm \
		-convert-math-to-llvm \
		-convert-math-to-libm \
		-convert-vector-to-llvm \
		-convert-func-to-llvm \
		-reconcile-unrealized-casts | \
		${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 


pad-constant-run:
	@${BUDDY_OPT} ./pad_constant.mlir  \
	    -one-shot-bufferize=bufferize-function-boundaries \
		-convert-linalg-to-loops \
		-convert-scf-to-cf \
		-expand-strided-metadata \
		-lower-affine \
		-convert-vector-to-llvm \
		-memref-expand \
		-convert-arith-to-llvm \
		-finalize-memref-to-llvm \
		-convert-func-to-llvm \
		-reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}

if-call-run:
	@${BUDDY_OPT} ./if-call.mlir  \
		-one-shot-bufferize=bufferize-function-boundaries \
		-convert-linalg-to-loops \
		-convert-scf-to-cf \
		-expand-strided-metadata \
		-lower-affine \
		-convert-vector-to-llvm \
		-memref-expand \
		-arith-expand \
		-convert-arith-to-llvm \
		-finalize-memref-to-llvm \
		-convert-math-to-llvm \
		-llvm-request-c-wrappers \
		-convert-func-to-llvm \
		-reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}


gen-dynamic-pad:
	@${BUDDY_OPT} ./dynamicPad.mlir  \
     	-arith-bufferize  -tensor-bufferize -linalg-bufferize \
     	-convert-linalg-to-loops -convert-scf-to-cf -func-bufferize \
     	-expand-strided-metadata \
		-finalizing-bufferize \
		-llvm-request-c-wrappers \
     	-finalize-memref-to-llvm -convert-func-to-llvm \
		-reconcile-unrealized-casts | \
	${MLIR_TRANSLATE} -mlir-to-llvmir | \
		${LLC} --mtriple=x86_64-unknown-linux-gnu -mattr=+avx512f -filetype=obj \
		-o ./dynamicPad.o
