#!/bin/sh

# install build dependency
echo 'Install build dependency'
apt-get install git build-essential pkg-config xorg-dev xutils-dev \
libdrm-dev autoconf gettext libtool automake libltdl-dev x11proto-dri2-dev \
libvdpau-dev

# get source
echo 'Get source from git'
git clone https://github.com/linux-sunxi/libvdpau-sunxi.git
git clone https://github.com/ssvb/xf86-video-sunxifb.git
git clone https://github.com/linux-sunxi/sunxi-mali.git
git clone https://github.com/robclark/libdri2.git

echo sunxi_cedar_mod | tee -a /etc/modules
cat <<END > /etc/udev/rules.d/50-mali.rules
KERNEL=="mali", MODE="0660", GROUP="video"
KERNEL=="ump", MODE="0660", GROUP="video"
KERNEL=="cedar_dev", MODE="0660", GROUP="video"
KERNEL=="disp", MODE="0660", GROUP="video"
END
 
cd ./libdri2
./autogen.sh
make
make install
cd ./sunxi-mali
git submodule init
git submodule update
make
make install
 
cd ./xf86-video-sunxifb
autoreconf -vi
./configure --prefix=/usr
make
make install
 
mkdir -p /usr/share/X11/xorg.conf.d/
cp xorg.conf /usr/share/X11/xorg.conf.d/99-sunxifb.conf
 
# FIX MESA SHIT
mkdir -p /usr/lib/arm-linux-gnueabihf/mesa-egl 
mv /lib/arm-linux-gnueabihf/libEGL.* /usr/lib/arm-linux-gnueabihf/mesa-egl/libEGL.*
 
