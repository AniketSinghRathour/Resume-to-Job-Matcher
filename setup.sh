#!/bin/bash
pip install --upgrade pip
python -m spacy download en_core_web_sm
nltk.download("punkt")
nltk.download("stopwords")

