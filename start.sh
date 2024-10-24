#!/bin/bash

# Check if model exists, if not, download it
if [ ! -d "/model" ]; then
  echo "Downloading Llama-3.2-11B Vision-Instruct model..."
  git clone https://${HF_TOKEN}@huggingface.co/meta-llama/Llama-3.2-11B-Vision-Instruct /model
fi

# Start the vLLM server
vllm_server --model /model --port 8000