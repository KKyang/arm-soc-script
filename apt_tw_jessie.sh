#! /bin/sh

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak

echo "deb http://free.nchc.org.tw/debian/ testing main contrib non-free
deb-src http://free.nchc.org.tw/debian/ testing main contrib non-free
deb http://free.nchc.org.tw/debian/ testing-updates main contrib non-free
deb-src http://free.nchc.org.tw/debian/ testing-updates main contrib non-free
deb http://free.nchc.org.tw/debian-security/ testing/updates main contrib non-free
deb-src http://free.nchc.org.tw/debian-security/ testing/updates  main contrib non-free
" |  sudo tee /etc/apt/sources.list


echo "deb http://packages.koodur.com jessie main" | \
    sudo tee /etc/apt/sources.list.d/koodur.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B8A6153D
sudo apt-get update