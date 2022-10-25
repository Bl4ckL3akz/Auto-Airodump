#!/bin/bash
# air_dump-installer.sh
# Name: air_dump-installer
# Author: BlackLeakz
# Version: 0.1a
# Date: 10/26/22



date +"%H:%M:%S"
echo -n "ConsoleLog<>> Airdump-installer started. " + date

echo -n "ConsoleLog<>> Creatin env. ~/air_dump + ~/air_dump/dumped_files "



sudo mkdir ~/air_dump
cd ~/air_dump
mkdir dumped_files
cd dumped_files;
sleep 1
echo -n "ConsoleLog<>> Owning permission for user: " + $me + "."
me=$(whoami)
sudo chown $me -hR ~/air_dump*;
sudo chmod 777 -R ~/air_dump*;
sleep 1


function get_distro() {
    if [[ -f /etc/os-release ]]
    then
        # On Linux systems
        source /etc/os-release
        echo $ID
    else
        # On systems other than Linux (e.g. Mac or FreeBSD)
        uname
    fi
}

arch() {
  sudo pacman -Syyuu
  sudo pacman -Sy base-devel libnl openssl ethtool util-linux zlib libpcap sqlite pcre hwloc cmocka hostapd wpa_supplicant tcpdump screen iw usbutils pciutils expect
  sudo pacman -Sy aircrack-ng  || echo "Installation failed" && continue;
  sudo pacman -Sy git;
  cd ~/air_dump
  wget https://download.aircrack-ng.org/aircrack-ng-1.7.tar.gz
  tar -zxvf aircrack-ng-1.7.tar.gz
  cd aircrack-ng-1.7
  autoreconf -i
  ./configure --with-experimental
  make
  make install
  ldconfig



}

debianubuntu() {
  apt-get install -y sudo;
  sudo apt-get update;
  a = "sudo apt-get install -y "
  sudo apt-get upgrade -y;
  sudo apt-get dist-upgrade -y;
  sudo apt-get autoremove -y;
  sudo apt-get update;

  x = ' || echo "Installation failed" && continue;'
  $a aircrack-ng make cmake build-essential sof*prop*c* python3-dev python*pip && $x
  $a python*venv && $x
  $a git wget curl unzip tar && $x
  $a gzip && $x
  $a build-essential autoconf && $x
  $a automake libtool && $x
  $a pkg-config libnl-3-dev && $x
  $a libnl-genl-3-dev libssl-dev && $x
  $a ethtool shtool rfkill zlib1g-dev && $x
  $a libpcap-dev libsqlite3-dev && $x
  $a libpcre3-dev libhwloc-dev && $x
  $a libcmocka-dev hostapd && $x
  $a wpasupplicant tcpdump && $x
  $a screen iw usbutils expect && $x
  $a pciutils && $x
  sudo apt-get install build-essential autoconf automake libtool pkg-config libnl-3-dev libnl-genl-3-dev libssl-dev ethtool shtool rfkill zlib1g-dev libpcap-dev libsqlite3-dev libpcre3-dev libhwloc-dev libcmocka-dev hostapd wpasupplicant tcpdump screen iw usbutils expect


  sleep 2
  cd ~/air_dump
  sudo mkdir tmp;
  sudo chmod 777 -R tmp;
  sudo chown $me -hR ./*
  cd tmp;
  sleep 1
  wget https://download.aircrack-ng.org/aircrack-ng-1.7.tar.gz
  tar -zxvf aircrack-ng-1.7.tar.gz
  cd aircrack-ng-1.7
  autoreconf -i
  ./configure --with-experimental
  make
  make install
  ldconfig
}


get_distro;

case $(get_distro) in
    case raspbian)
        echo "This is Raspbian"
        echo -n "ConsoleLog<>> Unsupported os. This is raspbian. EXIT!"
        exit
        ;;
    case "Arch Linux")
        echo "This is Arch"
        echo -n "Installing."
        arch
        ;;
    case fedora)
        echo "ConsoleLog<>> Unsupported os. This is Fedora. EXIT!"
        exit
        ;;
    case ubuntu)
        echo "This is Ubuntu"
        echo -n "Installing."
        debianubuntu
        ;;
    case Darwin)
        echo "ConsoleLog<>> Unsupported os. This is macOS. EXIT!"

        exit
        ;;
esac
