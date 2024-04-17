#!/bin/bash
BUDDY_OPT := ../../build/bin/buddy-opt
MLIR_OPT := ../../llvm/build/bin/mlir-opt
MLIR_CPU_RUNNER := ../../llvm/build/bin/mlir-cpu-runner
OPT_FLAG := -O0

ifeq ($(shell uname),Linux)
MLIR_RUNNER_UTILS := ../../llvm/build/lib/libmlir_runner_utils.so
MLIR_C_RUNNER_UTILS := ../../llvm/build/lib/libmlir_c_runner_utils.so
else ifeq ($(shell uname),Darwin)
MLIR_RUNNER_UTILS := ../../llvm/build/lib/libmlir_runner_utils.dylib
MLIR_C_RUNNER_UTILS := ../../llvm/build/lib/libmlir_c_runner_utils.dylib
endif

pad-run:
	@${BUDDY_OPT} ./pad.mlir  \
	    --tensor-bufferize --linalg-bufferize --tensor-bufferize \
		--convert-linalg-to-loops \
		--func-bufferize \
		--arith-bufferize \
		--finalizing-bufferize \
		--convert-scf-to-cf \
		--expand-strided-metadata \
		--lower-affine \
		--convert-vector-to-llvm --memref-expand -arith-expand \
		--convert-arith-to-llvm \
		--finalize-memref-to-llvm --convert-math-to-llvm \
		--llvm-request-c-wrappers \
		--convert-func-to-llvm \
		--reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}

padReflect:
	@${BUDDY_OPT} ./padReflect.mlir  \
	    --tensor-bufferize  --linalg-bufferize --tensor-bufferize \
		--convert-linalg-to-loops \
		--func-bufferize \
		--arith-bufferize \
		--convert-scf-to-cf \
		--finalizing-bufferize \
		--expand-strided-metadata \
		--lower-affine \
		--convert-vector-to-llvm --memref-expand -arith-expand \
		--convert-arith-to-llvm \
		--finalize-memref-to-llvm --convert-math-to-llvm \
		--llvm-request-c-wrappers \
		--convert-func-to-llvm \
		--reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}

padMaxLen:
	@${BUDDY_OPT} ./padToMaxLen.mlir  \
	    --tensor-bufferize --linalg-bufferize \
		--convert-linalg-to-loops \
		--func-bufferize \
		--arith-bufferize \
		--finalizing-bufferize \
		--convert-scf-to-cf \
		--expand-strided-metadata \
		--lower-affine \
		--convert-vector-to-llvm --memref-expand -arith-expand \
		--convert-arith-to-llvm \
		--finalize-memref-to-llvm --convert-math-to-llvm \
		--llvm-request-c-wrappers \
		--convert-func-to-llvm \
		--reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}

run-absPower:
	@${BUDDY_OPT} ./absPower.mlir  \
	    --tensor-bufferize  --linalg-bufferize --tensor-bufferize \
		--convert-linalg-to-loops \
		--func-bufferize \
		--arith-bufferize \
		--convert-scf-to-cf \
		--finalizing-bufferize \
		--expand-strided-metadata \
		--lower-affine \
		--convert-vector-to-llvm --memref-expand -arith-expand \
		--convert-arith-to-llvm \
		--finalize-memref-to-llvm --convert-math-to-llvm \
		--llvm-request-c-wrappers \
		--convert-func-to-llvm \
		--reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}

run-whisper:
	@${BUDDY_OPT} ./whisperFeatureExtraction.mlir  \
	    --tensor-bufferize  --linalg-bufferize --tensor-bufferize \
		--convert-linalg-to-loops \
		--func-bufferize \
		--arith-bufferize \
		--convert-scf-to-cf \
		--finalizing-bufferize \
		--expand-strided-metadata \
		--lower-affine \
		--convert-vector-to-llvm --memref-expand -arith-expand \
		--convert-arith-to-llvm \
		--finalize-memref-to-llvm --convert-math-to-llvm \
		--llvm-request-c-wrappers \
		--convert-func-to-llvm \
		--reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}


gen-hann:
	@${BUDDY_OPT} ./hanningWindow.mlir  \
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
		--convert-func-to-llvm \
		--reconcile-unrealized-casts | \
		${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 

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
		--reconcile-unrealized-casts | \
		${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 

arith-run: 
	@${BUDDY_OPT} ./arith.mlir  \
		--tensor-bufferize --linalg-bufferize --tensor-bufferize -bufferization-bufferize \
		--func-bufferize \
		--arith-expand  \
		--convert-math-to-funcs \
		--convert-vector-to-scf \
		--convert-linalg-to-loops \
		--convert-scf-to-cf \
		--convert-cf-to-llvm \
		--finalize-memref-to-llvm \
		--convert-arith-to-llvm \
		--convert-math-to-llvm \
		--convert-math-to-libm \
		--convert-vector-to-llvm \
		--convert-func-to-llvm \
		--finalizing-bufferize \
		--reconcile-unrealized-casts 
# ${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
# -shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 


linspace-run:
	@${BUDDY_OPT} ./linspace.mlir  \
		--tensor-bufferize --linalg-bufferize --tensor-bufferize -bufferization-bufferize \
		--func-bufferize \
		--arith-expand  \
		--convert-math-to-funcs \
		--convert-vector-to-scf \
		--convert-linalg-to-affine-loops \
		--lower-affine \
		--convert-scf-to-cf \
		--finalizing-bufferize \
		--finalize-memref-to-llvm \
		--convert-arith-to-llvm \
		--convert-math-to-llvm \
		--convert-math-to-libm \
		--convert-vector-to-llvm \
		--convert-func-to-llvm \
		--reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}

# Generate self.mel_filters
gen-mel-filter:
	@${BUDDY_OPT} ./initMelFilter.mlir  \
     	--arith-bufferize  --tensor-bufferize \
		--linalg-bufferize  --bufferization-bufferize \
		--func-bufferize \
		--arith-expand  \
		--convert-linalg-to-loops \
		--convert-scf-to-cf \
		--expand-strided-metadata \
		--finalize-memref-to-llvm \
		--convert-cf-to-llvm \
		--convert-func-to-llvm \
		-reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}

# Rfft computation for inputLength = 400 
run-rfft400:
	@${BUDDY_OPT} ./rfft400.mlir  \
		-tensor-bufferize -linalg-bufferize -tensor-bufferize -bufferization-bufferize \
		-func-bufferize \
		-arith-expand  \
		-convert-math-to-funcs \
		-convert-vector-to-scf \
		-convert-linalg-to-loops \
		-convert-scf-to-cf \
		-convert-cf-to-llvm \
		-finalizing-bufferize \
		-finalize-memref-to-llvm \
		-convert-arith-to-llvm \
		-convert-math-to-llvm \
		-convert-math-to-libm \
		-convert-vector-to-llvm \
		-convert-func-to-llvm \
		-reconcile-unrealized-casts | \
		${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS} 

example1:
	@${BUDDY_OPT} ./example.mlir  \
     	-arith-bufferize  -tensor-bufferize \
     	-convert-linalg-to-loops -convert-scf-to-cf -func-bufferize \
     	-expand-strided-metadata \
     	-finalize-memref-to-llvm -convert-func-to-llvm \
		-reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}


example2:
	@${BUDDY_OPT} ./example.mlir  \
     	--arith-bufferize --tensor-bufferize --linalg-bufferize\
		--convert-linalg-to-loops \
		--func-bufferize \
		--arith-expand  \
		--convert-scf-to-cf \
		--expand-strided-metadata \
		--finalizing-bufferize \
		--finalize-memref-to-llvm \
		--convert-arith-to-llvm \
		--convert-func-to-llvm \
		--reconcile-unrealized-casts | \
	${MLIR_CPU_RUNNER} ${OPT_FLAG} -e main -entry-point-result=void \
		-shared-libs=${MLIR_RUNNER_UTILS} -shared-libs=${MLIR_C_RUNNER_UTILS}


