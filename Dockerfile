FROM nvidia/cuda:11.4.0-devel-ubuntu18.04

# 默认使用上海时区 + 阿里源
RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
    echo Asia/Shanghai > /etc/timezone
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

# 通过 apt 安装 C++ 依赖库
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    build-essential cmake htop git vim unzip gdb sudo make wget libssl-dev \
    libopencv-dev python-opengl python3-opengl python3-pip

# 通过 pip 安装 python 依赖库
RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip

RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    scikit-build \
    Cython numpy scipy matplotlib PyOpenGL PyOpenGL-accelerate \
    sklearn opencv-python

RUN pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple \
    cupy-cuda114 Pillow torch

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    libeigen3-dev libgoogle-glog-dev libsuitesparse-dev \
    python3-dev python3-numpy python3-opencv python3-pip python3-pyproj \
    python3-scipy python3-yaml curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ceres-2.0
RUN wget https://github.com/ceres-solver/ceres-solver/archive/refs/tags/2.0.0.zip
RUN unzip 2.0.0.zip && cd ceres-solver-2.0.0 && \
    mkdir build && cd build && \
    cmake .. -DBUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF && \
    make -j && make install && \
    cd ../../ && rm -rf ceres-solver-2.0.0 && rm 2.0.0.zip