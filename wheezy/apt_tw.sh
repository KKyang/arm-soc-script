#! /bin/sh

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak

echo "deb ftp://free.nchc.org.tw/ubuntu-ports/ trusty main multiverse restricted universe
deb-src ftp://free.nchc.org.tw/ubuntu-ports/ trusty main multiverse restricted universe
deb ftp://free.nchc.org.tw/ubuntu-ports/ trusty-updates main multiverse restricted universe
deb-src ftp://free.nchc.org.tw/ubuntu-ports/ trusty-updates main multiverse restricted universe
deb ftp://free.nchc.org.tw/ubuntu-ports/ trusty-security main multiverse restricted universe
deb-src ftp://free.nchc.org.tw/ubuntu-ports/ trusty-security main multiverse restricted universe
" |  sudo tee /etc/apt/sources.list