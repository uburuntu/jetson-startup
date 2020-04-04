#!/usr/bin/env bash
set -e

cd /tmp

# Build and install library for ffmpeg
git clone https://github.com/jocover/jetson-ffmpeg.git
cd jetson-ffmpeg
mkdir build
cd build
cmake ..
make -j6
sudo make install
sudo ldconfig

# Build and install ffmpeg
git clone git://source.ffmpeg.org/ffmpeg.git -b release/4.2 --depth=1
cd ffmpeg
wget https://github.com/jocover/jetson-ffmpeg/raw/master/ffmpeg_nvmpi.patch
git apply ffmpeg_nvmpi.patch
./configure --enable-nvmpi
make -j6
sudo make install
