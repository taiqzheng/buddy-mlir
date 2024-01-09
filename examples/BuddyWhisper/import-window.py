import os
import math
import numpy as np
import torch
import torch._dynamo as dynamo
from torch.fx import symbolic_trace, GraphModule
from torch._inductor.decomposition import decompositions as inductor_decomp
from torch._functorch.aot_autograd import aot_autograd_decompositions

from buddy.compiler.frontend import DynamoCompiler
from buddy.compiler.ops import tosa

def model(M):
    values = np.array([0.0, M])
    M = values[1]

    if M < 1:
        return np.array([], dtype=values.dtype)
    if M == 1:
        return np.ones(1, dtype=values.dtype)
    n = np.arange(1-M, M, 2)
    return 0.5 + 0.5*math.cos(math.pi*n/(M-1))

symbolic_traced : torch.fx.GraphModule = symbolic_trace(model)

dynamo_compiler = DynamoCompiler(
    primary_registry=tosa.ops_registry,
    aot_autograd_decomposition=aot_autograd_decompositions,
)

with torch.no_grad():
    gm, params = dynamo_compiler.importer(model, 10)
