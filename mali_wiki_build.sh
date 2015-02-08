#! /bin/sh
modprobe mali
apt-get install git build-essential autoconf libtool
git clone https://github.com/linux-sunxi/libump.git
cd libump
apt-get install debhelper dh-autoreconf pkg-config
dpkg-buildpackage -b
dpkg -i ../libump_*.deb
autoreconf -i
./configure
make
make install
apt-get install git build-essential autoconf automake
apt-get install xutils-dev
git clone https://github.com/linux-sunxi/sunxi-mali.git
git submodule init
git submodule update
make config
git clone https://github.com/robclark/libdri2
cd libdri2
./autogen.sh
./configure
make
make install
ldconfig
cd ..
make install
apt-get install git build-essential xorg-dev xutils-dev x11proto-dri2-dev libltdl-dev libtool automake
git clone -b 0.4.0 https://github.com/ssvb/xf86-video-fbturbo.git
cd xf86-video-fbturbo
autoreconf -vi
./configure --prefix=/usr
make
make install rm /usr/share/X11/xorg.conf.d/99-sunxifb.conf
cp xorg.conf /etc/X11/xorg.conf
