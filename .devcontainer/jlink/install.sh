#!/bin/env sh

apt update

apt install -y \
    apt-transport-https \
    ca-certificates \
    libusb-1.0-0 \
    libx11-xcb1 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-sync1 \
    libxcb-util1 \
    libxcb-xfixes0 \
    libxcb-xkb1 \
    libxkbcommon-x11-0 \
    libxkbcommon0 \
    software-properties-common \
    udev \
    usbutils \
    xkb-data

wget --post-data "accept_license_agreement=accepted" https://www.segger.com/downloads/jlink/JLink_Linux_V874a_x86_64.deb

dpkg --unpack ./JLink_Linux_V874a_x86_64.deb

rm /var/lib/dpkg/info/jlink.postinst

dpkg --configure jlink

apt install -y --fix-broken