# 使用 Ubuntu 作為基礎映像
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# 安裝組譯器、連結器與除錯工具
RUN apt-get update && apt-get install -y \
    build-essential \
    nasm \
    gdb \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
