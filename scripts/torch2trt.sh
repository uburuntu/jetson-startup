#!/usr/bin/env bash
set -e

# Set your python executable
PYTHON="python3.6"

cd /tmp

git clone https://github.com/NVIDIA-AI-IOT/torch2trt
cd torch2trt
sudo ${PYTHON} setup.py install
