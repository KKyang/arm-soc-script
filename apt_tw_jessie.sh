#! /bin/sh

sudo mv /etc/apt/source.list /etc/apt/source.list.bak

echo "deb http://free.nchc.org.tw/debain testing main contrib no-free 
deb-src http://free.nchc.org.tw/debain testing main contrib no-free
deb http://free.nchc.org.tw/debain testing-updates main contrib no-free 
deb-src http://free.nchc.org.tw/debain testing-updates main contrib no-free
deb http://free.nchc.org.tw/debain-security testing/updates main contrib no-free 
deb-src http://free.nchc.org.tw/debain-security testing/updates  main contrib no-free
" |  sudo tee /etc/apt/source.list


echo "deb http://packages.koodur.com jessie main" | \
    sudo tee /etc/apt/sources.list.d/koodur.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B8A6153D
sudo apt-get update