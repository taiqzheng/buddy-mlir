from transformers import WhisperProcessor, WhisperForConditionalGeneration
from datasets import load_dataset

# load model and processor
processor = WhisperProcessor.from_pretrained("openai/whisper-base")
print("before this line, it call __init__")
model = WhisperForConditionalGeneration.from_pretrained("openai/whisper-base")
model.config.forced_decoder_ids = None

# load dummy dataset and read audio files
ds = load_dataset("hf-internal-testing/librispeech_asr_dummy", "clean", split="validation")
sample = ds[0]["audio"]  # sample = ds[0]["audio"]

print("here it call __call__")
input_features = processor(sample["array"], sampling_rate=sample["sampling_rate"], return_tensors="pt")
print(input_features)
