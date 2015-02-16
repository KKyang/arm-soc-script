#! /bin/bash

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak

echo "deb ftp://free.nchc.org.tw/ubuntu-ports/ utopic main multiverse restricted universe
deb-src ftp://free.nchc.org.tw/ubuntu-ports/ utopic main multiverse restricted universe
deb ftp://free.nchc.org.tw/ubuntu-ports/ utopic-updates main multiverse restricted universe
deb-src ftp://free.nchc.org.tw/ubuntu-ports/ utopic-updates main multiverse restricted universe
deb ftp://free.nchc.org.tw/ubuntu-ports/ utopic-security main multiverse restricted universe
deb-src ftp://free.nchc.org.tw/ubuntu-ports/ utopic-security main multiverse restricted universe
" |  sudo tee /etc/apt/sources.list


echo "deb http://packages.koodur.com utopic main" | \
    sudo tee /etc/apt/sources.list.d/koodur.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B8A6153D