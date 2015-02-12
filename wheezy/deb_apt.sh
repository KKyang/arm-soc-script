#! /bin/bash

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak

echo "deb http://free.nchc.org.tw/debian/ wheezy main contrib non-free
deb-src http://free.nchc.org.tw/debian/ wheezy main contrib non-free
deb http://free.nchc.org.tw/debian/ wheezy-updates main contrib non-free
deb-src http://free.nchc.org.tw/debian/ wheezy-updates main contrib non-free
deb http://free.nchc.org.tw/debian-security/ wheezy/updates main contrib non-free
deb-src http://free.nchc.org.tw/debian-security/ wheezy/updates  main contrib non-free
deb http://packages.cubian.org/ wheezy main
" |  sudo tee /etc/apt/sources.list


wget -O - http://packages.cubian.org/cubian.gpg.key | apt-key add -
sudo apt-get update
