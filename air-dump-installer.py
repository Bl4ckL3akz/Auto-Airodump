#!/usr/bin/env python3
# air-dump-installer.py

import os
import time
import sys
import subprocess
import platform
from os.path import *


def conf():
    os.system('sudo mkdir ~/air_dump')
    os.system('sudo mkdir ~/air_dump/dumped_files')
    os.chdir('~/air_dump')

def detectos():
    system = platform.system()
    machine = platform.machine()
    print("Detected system: " + system)
    print("Detected machine: " + machine)
    if system == "Linux":
        os.system('. /etc/os-release')
        os.system('echo $ID')
        os.system('echo $ID >> ~/air_dump/distro.name')
        os.system('cat ~/air_dump/distro.name')
        path = '~/air_dump/distro.name'
        distro_name = open(path, 'r')
        distro_name.read()
        if distro_name == "debian":
            debian()
        if distro_name == "ubuntu":
            debian()
        if distro_name == "arch linux":
            print("Unsupported. exit")
            sys.exit()

def debian():
    


def install_linux():





def main():
    print("ConsoleLog<>> Starting installation.")
    detectos()



if __name__ == '__main__':
    main()
