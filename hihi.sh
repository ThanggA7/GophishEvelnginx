#!/bin/bash
set -e

echo "==== [1/5] Cập nhật hệ thống & cài phụ thuộc ===="
sudo apt update
sudo apt install -y \
  wget tar \
  libfuse2 \
  libasound2 \
  libsecret-1-0 \
  gnome-keyring \
  seahorse \
  dbus-x11

echo "==== [2/5] Tải GoLogin mới nhất ===="
wget -O gologin.tar https://dl.gologin.com/gologin.tar

echo "==== [3/5] Giải nén GoLogin ===="
tar -xvf gologin.tar
cd GoLogin-*/ || { echo "❌ Không tìm thấy thư mục GoLogin"; exit 1; }
chmod +x GoLogin-*

echo "==== [4/5] Khởi động gnome-keyring cho user hiện tại ===="
killall gnome-keyring-daemon || true
eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh,gpg,pkcs11)
export $(/usr/bin/gnome-keyring-daemon --start)

# Đảm bảo DBus có chạy
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch)
fi

echo "==== [5/5] Chạy GoLogin (fix sandbox) ===="
./GoLogin-* --no-sandbox &
echo "✅ GoLogin đã khởi chạy!"
