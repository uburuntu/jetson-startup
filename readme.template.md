# Jetson Nano Developer Kit | Getting Started

Easy to run scripts and docs compilation.

Jetson Nano:
- https://developer.nvidia.com/embedded/jetson-nano-developer-kit

Forum with latest news: 
- https://forums.developer.nvidia.com/c/agx-autonomous-machines/jetson-embedded-systems/jetson-nano/76

{toc}

---

## ⚙️ Complete official Getting Started

[Getting Started With Jetson Nano Developer Kit](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit):
- [Introduction](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit)
- [Prepare for Setup](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#prepare)
- [Write Image to the microSD Card](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#write)
- [Setup and First Boot](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#setup)
- [Next Steps](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#next)
- [Troubleshooting](https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#troubleshooting)

## 🕯 PyTorch

Topic:
- https://forums.developer.nvidia.com/t/pytorch-for-jetson-nano-version-1-4-0-now-available/72048

`pytorch.sh` (specify versions at first lines):
```bash
{pytorch}
```

## ❇️PyTorch to TensorRT converter

Tool for converting PyTorch models to TensorRT:
- https://github.com/NVIDIA-AI-IOT/torch2trt

`torch2trt.sh`:
```bash
{torch2trt}
```

## 🎞 FFmpeg with hardware-accelerated encoding and decoding

Accelerated encoding of H.264 and HEVC and decoding of VP8, VP9, MPEG2, H.264 and HEVC.

Repo: [jocover](https://github.com/jocover) / [jetson-ffmpeg](https://github.com/jocover/jetson-ffmpeg)

`ffmpeg.sh`:
```bash
{ffmpeg}
```

Usage examples:
- `ffmpeg -c:v h264_nvmpi -i input_file -f null -`
- `ffmpeg -i input_file -c:v h264_nvmpi <output.mp4>`

---

## 🗂 Other tutorials

- https://elinux.org/Jetson_Zoo
  - TensorFlow with Keras
  - MXNet
  - ROS
  - NVIDIA Isaac SDK
  - ... and others
