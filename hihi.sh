#!/bin/bash
set -e

echo "🔧 Đang chuẩn bị môi trường cho GoLogin..."

# Cài gói cần thiết
sudo apt update
sudo apt install -y libsecret-1-0 gnome-keyring seahorse dbus-x11 libasound2t64 libfuse2t64

# Khởi động lại keyring daemon
killall gnome-keyring-daemon || true
eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh,gpg,pkcs11)
export $(/usr/bin/gnome-keyring-daemon --start)

# Đảm bảo DBus có chạy
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval $(dbus-launch)
fi

echo "🚀 Chạy GoLogin..."
~/gologin_extracted/GoLogin
