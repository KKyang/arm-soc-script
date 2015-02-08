#! /bin/sh

sudo apt-get -y install git-core build-essential \
libusb-1.0.0-dev pkg-config xorg-dev xutils-dev \
libdrm-dev autoconf gettext libtool automake libltdl-dev  \
x11proto-dri2-dev libvdpau-dev
git clone https://github.com/linux-sunxi/libvdpau-sunxi.git
git clone https://github.com/ssvb/xf86-video-sunxifb.git
git clone git://github.com/linux-sunxi/sunxi-tools.git
git clone https://github.com/hglm/a10disp.git
git clone https://github.com/linux-sunxi/sunxi-mali.git
git clone https://github.com/robclark/libdri2.git
cd sunxi-tools
make
cd ../a10disp
cp ../xf86-video-sunxifb/src/sunxi_disp_ioctl.h .
make clean
make
echo sunxi_cedar_mod | sudo tee -a /etc/modules
# this must use root ?
cat <<END > /etc/udev/rules.d/50-mali.rules
KERNEL=="mali", MODE="0660", GROUP="video"
KERNEL=="ump", MODE="0660", GROUP="video"
KERNEL=="cedar_dev", MODE="0660", GROUP="video"
KERNEL=="disp", MODE="0660", GROUP="video"
END
 
cd ../libdri2
./autogen.sh
make
sudo make install
cd ../sunxi-mali
git submodule init
git submodule update
sudo make
sudo make install
 
cd ../xf86-video-sunxifb
autoreconf -vi
./configure --prefix=/usr
make
sudo make install
 
sudo mkdir /usr/share/X11/xorg.conf.d/
sudo cp xorg.conf /usr/share/X11/xorg.conf.d/99-sunxifb.conf
 
# FIX MESA SHIT 
# linaro ubuntu already move mesa-egl to /usr/lib/arm-linux-gnueabihf/mesa-egl ?
mkdir /usr/lib/arm-linux-gnueabihf/mesa-egl
mv /usr/lib/arm-linux-gnueabihf/libEGL.* /usr/lib/arm-linux-gnueabihf/mesa-egl/
 
# You should see something
cd ../libvdpau-sunxi
make
sudo make install
#sudo apt-get remove --purge libusb-1.0.0-dev pkg-config libdri2-dev xorg-dev xutils-dev libdrm-dev autoconf gettext libtool automake libltdl-dev  x11proto-dri2-dev \
#libvdpau-dev

cat <<END > .mplayer/config
# Write your default config options here!
 
vo=vdpau,
vc=ffmpeg12vdpau,ffh264vdpau,ffwmv3vdpau,ffvc1vdpau,
END
 
echo "VDPAU_DRIVER=sunxi" | sudo tee -a /etc/environment
echo "VDPAU_DRIVER=sunxi" | sudo tee -a /etc/X11/Xsession.d/10sunxi
echo "export VDPAU_DRIVER" | sudo tee -a /etc/X11/Xsession.d/10sunxi