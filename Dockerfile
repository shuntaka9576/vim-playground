FROM ubuntu:22.04

# タイムゾーンの設定（インタラクティブプロンプトを回避）
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# 基本的なパッケージをインストール
RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
    curl \
    wget \
    build-essential \
    ripgrep \
    fd-find \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 最新のNeovimをインストール（公式PPA）
RUN add-apt-repository ppa:neovim-ppa/unstable -y \
    && apt-get update \
    && apt-get install -y neovim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# neovimの設定ディレクトリを作成
RUN mkdir -p /root/.config/nvim

# 作業ディレクトリを設定
WORKDIR /workspace

# neovimをエントリーポイントに設定
ENTRYPOINT ["nvim"]
