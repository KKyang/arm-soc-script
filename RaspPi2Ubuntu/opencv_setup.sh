#! /bin/bash

# install build dependency 
sudo apt-get -y build-dep opencv
sudo apt-get -y install build-essential checkinstall cmake pkg-config cmake-qt-gui
# install gstream
sudo apt-get install libgstreamer0.10-0 libgstreamer0.10-dev \
gstreamer0.10-tools gstreamer0.10-plugins-base \
libgstreamer-plugins-base0.10-dev gstreamer0.10-plugins-good \
gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad gstreamer0.10-ffmpeg
# tbb support
#sudo apt-get -y install libtbb-dev
# python2 support
sudo apt-get -y install python-dev python-numpy
# python3 support
sudo apt-get -y install python3-dev python3-numpy

# get source
wget https://github.com/Itseez/opencv/archive/3.0.0-beta.zip
unzip 3.0.0-beta.zip
cd opencv-3.0.0-beta
mkdir build
cd build