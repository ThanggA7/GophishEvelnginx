#!/bin/bash

set -e

echo "[1/3] Cài gói gnome-keyring..."
sudo apt update
sudo apt install -y gnome-keyring seahorse

echo "[2/3] Khởi động lại dịch vụ keyring cho user hiện tại..."
if ! pgrep -x "gnome-keyring-daemon" > /dev/null; then
  eval $(gnome-keyring-daemon --start --components=secrets,ssh,gpg,pkcs11)
  export $(gnome-keyring-daemon --start)
fi

echo "[3/3] Chạy GoLogin..."
EXECUTABLE=$(find "$HOME/gologin_extracted" -maxdepth 2 -type f -name "GoLogin*" | head -n 1)

if [ -n "$EXECUTABLE" ]; then
  chmod +x "$EXECUTABLE"
  "$EXECUTABLE"
else
  echo "❌ Không tìm thấy file GoLogin trong $HOME/gologin_extracted"
  exit 1
fi
