# ===- import-clip.py ----------------------------------------------------------
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ===---------------------------------------------------------------------------
#
# This is the test of clip model.
#
# ===---------------------------------------------------------------------------

import os

from PIL import Image
import requests
import numpy
import torch
from transformers import CLIPProcessor, CLIPModel
from torch._functorch.aot_autograd import aot_autograd_decompositions
from torch.fx import symbolic_trace, GraphModule # 111

from buddy.compiler.frontend import DynamoCompiler
from buddy.compiler.ops import tosa

model_path = "openai/clip-vit-base-patch32"
model = CLIPModel.from_pretrained(model_path)
processor = CLIPProcessor.from_pretrained(model_path)
url = "http://images.cocodataset.org/val2017/000000039769.jpg"
image = Image.open(requests.get(url, stream=True).raw)

inputs = processor(text=["a photo of a cat", "a photo of a dog"], images=image, return_tensors="pt", padding=True)
print(inputs.pixel_values.__dict__)

dynamo_compiler = DynamoCompiler(
    primary_registry=tosa.ops_registry,
    aot_autograd_decomposition=aot_autograd_decompositions,
)

with torch.no_grad():
    gm, params = dynamo_compiler.importer(model, **inputs)

with open(
    os.path.dirname(os.path.abspath(__file__)) + "/clip.mlir", "w"
) as module_file:
    print(gm, file=module_file)
