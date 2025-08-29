#!/bin/bash

set -e

URL="https://dl.gologin.com/gologin.tar"
FILENAME="gologin.tar"
EXTRACT_DIR="$HOME/gologin_extracted"

echo "[1/4] Cài thư viện phụ thuộc..."
sudo apt update

# Detect Ubuntu version 2
UBUNTU_VERSION=$(lsb_release -rs | cut -d'.' -f1)

if [ "$UBUNTU_VERSION" -ge 24 ]; then
    echo "→ Ubuntu $UBUNTU_VERSION.x phát hiện: dùng libasound2t64"
    sudo apt install -y wget tar libfuse2t64 libasound2t64 libasound2-data libasound2-plugins libsecret-1-0 libsecret-1-dev
else
    echo "→ Ubuntu $UBUNTU_VERSION.x phát hiện: dùng libasound2"
    sudo apt install -y wget tar libfuse2 libasound2 libasound2-data libasound2-plugins libsecret-1-0 libsecret-1-dev
fi

echo "[2/4] Tải GoLogin từ $URL..."
wget -O "$FILENAME" "$URL"

echo "[3/4] Giải nén GoLogin..."
rm -rf "$EXTRACT_DIR"
mkdir -p "$EXTRACT_DIR"
tar -xf "$FILENAME" -C "$EXTRACT_DIR"

echo "[4/4] Chạy GoLogin..."
EXECUTABLE=$(find "$EXTRACT_DIR" -maxdepth 2 -type f -name "GoLogin*" | head -n 1)

if [ -n "$EXECUTABLE" ]; then
  chmod +x "$EXECUTABLE"
  "$EXECUTABLE"
else
  echo "❌ Không tìm thấy file thực thi trong $EXTRACT_DIR"
  exit 1
fi
