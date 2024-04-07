#!/bin/bash

set -e
set -x
set -u

# Not updating this script often enough:
APT_ARGS="--yes --ignore-missing"

sudo apt update
sudo apt dist-upgrade --yes

sudo apt install $APT_ARGS \
    tmux \
    vim \
    htop \
    zsh \
    curl \
    git \
    cmake \
    gawk \
    xsel \
    xclip \
    gconf \
    build-essential \
    autotools-dev \
    dh-autoreconf \
    ffmpeg \
    gcc-12 \
    g++-12 \
    clang \
    libclang-dev \
    llvm \
    llvm-dev \
    cargo \
    golang-go \
    npm \
    feh \
    vlc \
    gimp \
    wine \
    gradle \
    openjdk-17-jre \
    openjdk-17-jdk \
    docker \
    docker.io \
    docker-compose \
    virtualbox \
    virtualbox-guest-utils \
    qemu-user \
    qemu-user-static \
    qemu-kvm \
    qemu-system-arm \
    python3-pip \
    python3.10-venv \
    python3-distutils \
    pandoc \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-extra-utils \
    texlive-latex-extra \
    texlive-full \
    libsdl2-image-dev \
    libsdl-mixer1.2 \
    libsdl2-mixer-2.0-0 \
    libsdl2-mixer-dev \
    libsdl-mixer1.2-dev \
    libvirt-daemon-system \
    libvirt-clients \
    libncurses-dev \
    libfuse-dev \
    libfuse3-dev \
    libopencv-dev \
    lib32gcc-10-dev \
    lib32gcc-11-dev \
    zlib1g-dev \
    rapidjson-dev \
    cpu-checker \
    bridge-utils \
    alacarte \
    nethogs \
    nasm \
    linux-tools-generic \
    linux-cloud-tools-generic \
    cloudcompare \
    progress \
    gdbserver \
    gcc-12-aarch64-linux-gnu \
    gcc-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu-dbg

sudo apt install $APT_ARGS \
   gcc-multilib \
   g++-multilib
