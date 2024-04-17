//===- WhisperPreprocessor.cpp --------------------------------------------===//
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
//===----------------------------------------------------------------------===//
//
// This file implements the benchmark for Whisper Preprocessor function.
//
//===----------------------------------------------------------------------===//

#include <buddy/Core/Container.h>
#include <cstdint>
#include <iostream>

// Declare the whisper preprocessor C interface.
extern "C" {
  MemRef<float, 3> _mlir_ciface_whisper_preprocessor(MemRef<double, 1> *rawSpeech);
}

int main() {
  // MemRef copys all data, so data here are actually not accessed.
  intptr_t sizesInput[1] = {2};
  MemRef<double, 1> inputAudioMem(sizesInput);
  // Initialize input audio MemRef.
  double a[2] = {1.0, 2.0};
  inputAudioMem = std::move(MemRef<double, 1>(a, sizesInput));
//   inputAudioMem = std::move(MemRef<double, 1>(rawSpeech, sizesInput));

  
  // Generate an empty MemRef for output
  float *outputAlign = new float[240000];
  intptr_t sizesOutput[3] = {1, 80, 3000};
  MemRef<float, 3> output(outputAlign, sizesOutput);

  // Generate whisper preprocessor result.
  std::cout << "-----------------------------------------" << std::endl;
  std::cout << "[ whisper preprocessor result ]" << std::endl;

  output = _mlir_ciface_whisper_preprocessor(&inputAudioMem);

  std::cout << "-----------------------------------------" << std::endl;

  return 0;
}


