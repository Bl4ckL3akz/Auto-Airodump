main() {
  date +"%H:%M:%S"
  echo -n "ConsoleLog<>> Airdump-installer started. " + date
  sleep 1
  conf;
}

conf() {
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
}
main;
sleep 1
echo -n "ConsoleLog<>> Installing for arch."
sleep 1
sudo pacman -Syyuu
sudo pacman -Sy base-devel libnl openssl ethtool util-linux zlib libpcap sqlite pcre hwloc cmocka hostapd wpa_supplicant tcpdump screen iw usbutils pciutils expect
sudo pacman -Sy aircrack-ng  || echo "Installation failed" && continue;
sudo pacman -Sy git || echo "Installation failed" && continue;
cd ~/air_dump
wget https://download.aircrack-ng.org/aircrack-ng-1.7.tar.gz
tar -zxvf aircrack-ng-1.7.tar.gz
cd aircrack-ng-1.7
autoreconf -i
./configure --with-experimental
make
make install
ldconfig
