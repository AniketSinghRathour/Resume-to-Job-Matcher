#!/bin/bash
# Fix Rust compiler issue for tokenizers
apt update && apt install -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"

# Ensure compatible Python version
if ! python3.10 --version &>/dev/null; then
    apt install -y python3.10 python3.10-venv python3.10-dev
fi
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Install spaCy model
python3 -m spacy download en_core_web_sm
