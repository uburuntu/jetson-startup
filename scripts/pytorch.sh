#!/usr/bin/env bash
set -e

# Set your python executable
PYTHON="python3.6"
# Set PyTorch version, available: 1.0.0 1.1.0 1.2.0 1.3.0 1.4.0
PYTORCH_VERSION="1.4.0"

PIP="${PYTHON} -m pip"

declare -A TORCHVISION_VERSIONS=(
    ["1.4.0"]="v0.5.0"
    ["1.3.0"]="v0.4.2"
    ["1.2.0"]="v0.4.0"
    ["1.1.0"]="v0.3.0"
    ["1.0.0"]="v0.2.2"
)
TORCHVISION_VERSION=${TORCHVISION_VERSIONS[${PYTORCH_VERSION}]}

declare -A WHEEL_LINKS=(
    ["2.7-1.4.0"]="https://nvidia.box.com/shared/static/1v2cc4ro6zvsbu0p8h6qcuaqco1qcsif.whl"
    ["2.7-1.3.0"]="https://nvidia.box.com/shared/static/6t52xry4x2i634h1cfqvc9oaoqfzrcnq.whl"
    ["2.7-1.2.0"]="https://nvidia.box.com/shared/static/8gcxrmcc6q4oc7xsoybk5wb26rkwugme.whl"
    ["2.7-1.1.0"]="https://nvidia.box.com/shared/static/n9p7u0tem1hqe0kyhjspzz78xpka7f5e.whl"
    ["2.7-1.0.0"]="https://nvidia.box.com/shared/static/d5v4bngglqhdbr4g9ir4eeg6k6miwqnv.whl"
    ["3.6-1.4.0"]="https://nvidia.box.com/shared/static/ncgzus5o23uck9i5oth2n8n06k340l6k.whl"
    ["3.6-1.3.0"]="https://nvidia.box.com/shared/static/phqe92v26cbhqjohwtvxorrwnmrnfx1o.whl"
    ["3.6-1.2.0"]="https://nvidia.box.com/shared/static/06vlvedmqpqstu1dym49fo7aapgfyyu9.whl"
    ["3.6-1.1.0"]="https://nvidia.box.com/shared/static/mmu3xb3sp4o8qg9tji90kkxl1eijjfc6.whl"
    ["3.6-1.0.0"]="https://nvidia.box.com/shared/static/2ls48wc6h0kp1e58fjk21zast96lpt70.whl"
)
declare -A WHEEL_NAMES=(
    ["2.7-1.4.0"]="torch-1.4.0-cp27-cp27mu-linux_aarch64.whl"
    ["2.7-1.3.0"]="torch-1.3.0-cp27-cp27mu-linux_aarch64.whl"
    ["2.7-1.2.0"]="torch-1.2.0a0+8554416-cp27-cp27mu-linux_aarch64.whl"
    ["2.7-1.1.0"]="torch-1.1.0-cp27-cp27mu-linux_aarch64.whl"
    ["2.7-1.0.0"]="torch-1.0.0a0+bb15580-cp27-cp27mu-linux_aarch64.whl"
    ["3.6-1.4.0"]="torch-1.4.0-cp36-cp36m-linux_aarch64.whl"
    ["3.6-1.3.0"]="torch-1.3.0-cp36-cp36m-linux_aarch64.whl"
    ["3.6-1.2.0"]="torch-1.2.0a0+8554416-cp36-cp36m-linux_aarch64.whl"
    ["3.6-1.1.0"]="torch-1.1.0-cp36-cp36m-linux_aarch64.whl"
    ["3.6-1.0.0"]="torch-1.0.0a0+bb15580-cp36-cp36m-linux_aarch64.whl"
)

make_checks() {
    if ! hash ${PYTHON}; then
        echo "Error: ${PYTHON} is not found"
        exit 1
    fi

    PYTHON_VERSION=$(${PYTHON} -V 2>&1 | sed 's/.* \([0-9]\).\([0-9]\).*/\1.\2/')
    if [[ "$PYTHON_VERSION" != "2.7" ]] && [[ "$PYTHON_VERSION" != "3.6" ]]; then
        echo "Error: this script requires Python 2.7 or 3.6"
        exit 2
    fi
}

install_dependencies() {
    sudo apt-get install -y libopenblas-base libjpeg-dev zlib1g-dev
    eval "${PIP} install Cython numpy pillow\<7"
}

install_pytorch() {
    cd /tmp
    key="${PYTHON_VERSION}-${PYTORCH_VERSION}"
    wget ${WHEEL_LINKS[$key]} -O ${WHEEL_NAMES[$key]}
    eval "${PIP} install ${WHEEL_NAMES[$key]}"
}

install_torchvision() {
    cd /tmp
    git clone --branch ${TORCHVISION_VERSION} https://github.com/pytorch/vision torchvision
    cd torchvision
    sudo ${PYTHON} setup.py install
}

# Run
make_checks
install_dependencies
install_pytorch
install_torchvision
