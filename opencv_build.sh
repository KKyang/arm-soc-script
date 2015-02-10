#! /bin/sh

# install build dependency 
sudo apt-get -y build-dep opencv
sudo apt-get -y install build-essential checkinstall cmake pkg-config yasm
sudo apt-get -y install libxine2-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
sudo apt-get -y install x264 v4l-utils libx264-dev
# gstreamer
sudo apt-get -y install libgstreamer0.10-0 libgstreamer0.10-dev \
gstreamer0.10-tools gstreamer0.10-plugins-base libgstreamer-plugins-base0.10-dev \
gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad
# tbb support
sudo apt-get -y install libtbb-dev
# python2 support
sudo apt-get -y python2-dev python-numpy
# python3 support
sudo apt-get -y python3-dev python3-numpy

# get source
wget https://github.com/Itseez/opencv/archive/3.0.0-beta.zip
unzip 3.0.0-beta.zip
cd opencv-3.0.0-beta
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=RELEASE -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF \
 -DBUILD_PERF_TESTS=OFF -DBUILD_TESTS=OFF -DBUILD_opencv_java=OFF \
 -DENABLE_NEON=ON -DWITH_QT=OFF -DWITH_TBB=ON -DWITH_OPENGL=ON \
 -DPYTHON_EXECUTABLE=/usr/bin/python2.7 ../ > cmake_log
make -j2 > build.log
#sudo make install