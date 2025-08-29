#!/bin/bash
set -e

echo "==== [1/5] Cập nhật hệ thống & cài thư viện cần thiết ===="
sudo apt update
sudo apt install -y \
    libfuse2 \
    libasound2 \
    libsecret-1-0 \
    gnome-keyring \
    seahorse \
    dbus-x11 \
    libnss3 \
    libxss1 \
    libxtst6 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgbm1 \
    libdrm2 \
    libxkbcommon0

echo "==== [2/5] Tải GoLogin mới nhất ===="
cd ~
rm -rf gologin.tar gologin_extracted
wget -O gologin.tar https://dl.gologin.com/gologin.tar

echo "==== [3/5] Giải nén GoLogin ===="
mkdir -p ~/gologin_extracted
tar -xf gologin.tar -C ~/gologin_extracted

echo "==== [4/5] Khởi động gnome-keyring cho user hiện tại ===="
if ! pgrep -x "gnome-keyring-daemon" > /dev/null; then
    eval $(gnome-keyring-daemon --start --components=secrets,ssh,gpg,pkcs11)
    export $(gnome-keyring-daemon --start)
fi

echo "==== [5/5] Chạy GoLogin ===="
EXECUTABLE=$(find "$HOME/gologin_extracted" -maxdepth 2 -type f -name "GoLogin*" | head -n 1)

if [ -n "$EXECUTABLE" ]; then
    chmod +x "$EXECUTABLE"
    "$EXECUTABLE" &
    echo "✅ GoLogin đã chạy!"
else
    echo "❌ Không tìm thấy file GoLogin trong ~/gologin_extracted"
    exit 1
fi
