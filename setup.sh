#!/bin/bash

# Ensure system is up to date
apt update && apt install -y curl python3.10 python3.10-venv python3.10-dev

# Install Rust (required for tokenizers)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"

# Use Python 3.10 as default
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Remove old Python packages
python3 -m pip cache purge
python3 -m pip uninstall -y numpy spacy thinc transformers huggingface_hub

# Upgrade pip & setuptools
python3 -m pip install --upgrade pip setuptools wheel

# Install CPU-optimized PyTorch
pip install --no-cache-dir torch==2.0.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Install spaCy model
python3 -m spacy download en_core_web_sm
