#!/bin/bash
# dump_air.sh
# Author: BlackLeakz
# Version: 0.1a
# Date: 10/26/22

date +"%H:%M:%S"
echo -n "ConsoleLog<>> Airdump started. " + date
echo -n "ConsoleLog<>> Creatin env. ~/air_dump + ~/air_dump/dumped_files "
sudo mkdir ~/air_dump
cd ~/air_dump
mkdir dumped_files
cd dumped_files;

echo -n "ConsoleLog<>> Owning permission for user: " + $me + "."
me=$(whoami)
sudo chown $me -hR ~/air_dump*;
sudo chmod 777 -R ~/air_dump*;

echo -n "ConsoleLog<>> Your created enviroment: "
sudo ls -l ~/air_dump;
sudo ls -l ~/air_dump/dumped_files;

echo -n "ConsoleLog<>> Dumping ifconfig result to:  ~/air_dump/ifconfig.list"
sudo ifconfig >> ~/air_dump/ifconfig.list

echo -n "ConsoleLog<>> Your IFCONFIG:"
cat ~/air_dump/ifconfig.list;
echo -n "ConsoleLog<>> Dumping your eth interfaces."
ip route | grep default | sed -e "s/^.*dev.//" -e "s/.proto.*//" >> ~/air_dump/ifconfig_eth_iface.list
echo -n "ConsoleLog<>> Your eth ifaces are: "
cat ~/air_dump/ifconfig_eth_iface.list


echo -n "ConsoleLog<>> Reading ifconfig file."
input="~/air_dump/ifconfig_eth_iface.list"
echo -n "ConsoleLog<>> Reading file. : " $input
while IFS= read -r line
do
  echo "$line"
done < "$input"


echo -n "ConsoleLog<>> Dumping all ifaces."
pci=`lspci  | awk '/Ethernet/{print $1}'`; find /sys/class/net ! -type d | xargs --max-args=1 realpath  | awk -v pciid=$pci -F\/ '{if($0 ~ pciid){print $NF}}' >> ~/air_dump/full_ifaces.list
sleep 3
echo -n "ConsoleLog<>> All interface: "
cat ~/air_dump/full_ifaces.list

sleep 4

input2="~/air_dump/full_ifaces.list"
echo -n "ConsoleLog<>> Reading file. : " + $input2
while IFS= read -r linex
do
  echo "$linex"
done < "$input2"



my_manualconf() {
  echo -n "ConsoleLog<>> Set iface down-"
  sudo ifconfig wlx98ded00e4965 down
  echo -n "ConsoleLog<>> Changing MAC."
  sudo macchanger -r wlx98ded00e4965
  echo -n "ConsoleLog<>> Set iface up-"
  sudo ifconfig wlx98ded00e4965 up
  echo -n "ConsoleLog<>> Starting mon-mode."
  sudo airmon-ng start wlx98ded00e4965
  echo -n "ConsoleLog<>> Staring airodump."
  sudo airodump-ng wlx98ded00e4965 --output-format pcap --write ~/air_dump/dumped_files/file.dump
}
