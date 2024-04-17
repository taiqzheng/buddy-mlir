import os
from typing import List, Callable
import numpy
import torch
from transformers import WhisperProcessor, WhisperForConditionalGeneration
from datasets import load_dataset
import torch._dynamo as dynamo
torch._dynamo.config.suppress_errors = True

from torch._inductor.decomposition import decompositions as inductor_decomp
from torch._functorch.aot_autograd import aot_module_simplified

from buddy.compiler.frontend import DynamoCompiler
from buddy.compiler.ops import tosa

import torch._inductor.config

import warnings
warnings.filterwarnings('ignore')

def DynamoCompiler(gm:torch.fx.GraphModule,
                   inputs:List[torch.Tensor]) -> callable:
    def _compiler(gm:torch.fx.GraphModule,
                   inputs:List[torch.Tensor]):
        gm.graph.print_tabular()
        return gm.forward
    return aot_module_simplified(gm,inputs,fw_compiler=_compiler)

class WhisperModel(torch.nn.Mothondule):
    def __init__(self):
        super().__init__()
        self.model = WhisperProcessor.from_pretrained("openai/whisper-base")
        self.model.eval()

    def forward(self, array, sampling_rate):
        return self.model(array, sampling_rate=sampling_rate, return_tensors="pt")
    
# load model and processor
model_path = "openai/whisper-base"
processor = WhisperProcessor.from_pretrained(model_path)

# load dummy dataset and read audio files
ds = load_dataset("hf-internal-testing/librispeech_asr_dummy", "clean", split="validation")
sample = ds[0]["audio"]

whisper_model = WhisperModel()

the_model = dynamo.optimize(backend = DynamoCompiler)(whisper_model)
output = the_model(sample["array"], sampling_rate=sample["sampling_rate"])