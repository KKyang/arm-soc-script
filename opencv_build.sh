#! /bin/sh

# install build dependency 
sudo apt-get build-dep opencv -y
sudo apt-get install libtbb-dev python3-dev python3-numpy -y

# get source
wget https://github.com/Itseez/opencv/archive/3.0.0-beta.zip
unzip -qq 3.0.0-beta.zip
cd opencv-3.0.0-beta
mkdir build
cd build
cmake -CMAKE_BUILD_TYPE=RELEASE -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF \
 -DBUILD_PERF_TESTS=OFF -DBUILD_TESTS=OFF -DBUILD_opencv_java=OFF \
 -DENABLE_NEON=ON -DWITH_QT=OFF -DWITH_TBB=ON -DWITH_OPENGL=ON \
 -DPYTHON_EXECUTABLE=/usr/bin/python2.7 ../
make 
sudo make install