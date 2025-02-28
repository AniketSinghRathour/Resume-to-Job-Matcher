#!/bin/bash

# Ensure system is up to date
apt update && apt install -y curl python3.10 python3.10-venv python3.10-dev

# Install Rust (Required for Tokenizers)
if ! command -v rustc &> /dev/null
then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Set Python 3.10 as Default
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Upgrade pip & setuptools
python3 -m pip install --upgrade pip setuptools wheel

# Ensure PyTorch is Installed
pip install torch==2.0.1 --index-url https://download.pytorch.org/whl/cpu

# Ensure SpaCy Model is Installed Only Once
if [ ! -d "/home/adminuser/.cache/spacy" ]; then
    python3 -m spacy download en_core_web_sm
fi
