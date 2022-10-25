#!/usr/bin/env python3
# air-dump.py
# Author: BlackLeakz
# Version: 0.1a



os.system('pci=`lspci  | awk '/Ethernet/{print $1}'`; find /sys/class/net ! -type d | xargs --max-args=1 realpath  | awk -v pciid=$pci -F\/ '{if($0 ~ pciid){print $NF}}' >> ~/air_dump/ifaces.list')




def main():




if __name__ == '__main__':
    main()
