#!/usr/bin/env python3
# air-dump-installer.py

import os
import time
import sys
import subprocess
import platform
from time import sleep
from os.path import *


def conf():
    os.system('me=$(whoami)')
    os.system('me=$(whoami) && sudo mkdir -p /home/$me/air_dump')

    time.sleep(1)
    os.system('me=$(whoami) && sudo chown $me -hR ~/*')
    time.sleep(1)
    os.system('me=$(whoami) && sudo chmod a+x -R ~/*')
    time.sleep(1)
    os.system('me=$(whoami) && cd /home/$me')
    time.sleep(1)
    os.system('me=$(whoami) && whoami >> /home/$me/air_dump/me.bin')
    time.sleep(1.5)
    os.system('me=$(whoami) && sudo mkdir -p /home/$me/air_dump/dumped_files')
    time.sleep(2)
    os.system('me=$(whoami) && cd /home/$me/air_dump')
    time.sleep(1.5)
    os.system('me=$(whoami) && sudo chown $me -hR /home/$me')
    time.sleep(1)

    os.system('me=$(whoami) && cd /home/$me/air_dump')
    os.system('me=$(whoami) && sudo chown $me -hR ~/*')
    time.sleep(1)
    os.system('me=$(whoami) && sudo chmod a+x -R ~/*')
    time.sleep(1.5)
    print("ConsoleLog<>> Check working dir.")
    os.system('cd ~/air_dump')
    time.sleep(0.5)
    x = os.getcwd()
    time.sleep(0.5)
    print(x)

    with open(x + '/air_dump/me.bin') as f:
        for line in f:
            print(line, end="")
    time.sleep(3)


    for linex in open(x + "/air_dump/me.bin"):
        print(linex)
    time.sleep(1)
    system = platform.system()
    machine = platform.machine()
    print("Detected system: " + system)
    print("Detected machine: " + machine)
    if system == "Linux":
        os.system('cd ~/air_dump')
        time.sleep(1)

        path = os.getcwd()
        print(path)
        time.sleep(1)

        os.system('. /etc/os-release')
        os.system('echo $ID')

        os.system('me=$(whoami) && echo $ID >> /home/$me/air_dump/distro.name')
        time.sleep(2)
        os.system('me=$(whoami) && cat /home/$me/air_dump/distro.name')


        l = os.getcwd()
        print(l)
        time.sleep(1)
        os.chdir('air_dump')
        time.sleep(0.5)
        o = os.getcwd()
        print(o)
        time.sleep(0.5)

        path = '/distro.name'
        distro_name = open(o + path, 'r')
        xs = distro_name.read()
        time.sleep(1)
        print(xs)
        if xs == "debian":
            debian()
        if xs == "ubuntu":
            debian()
        if xs == "arch linux":
            print("Unsupported. exit")
            sys.exit()
        path = os.getcwd()
        with open(o + "/distro.name") as f:
            for line in f:
                dist = print(line, end="")
        if dist == 'debian':
            print("Detected Debian. Continue.")
            debian()






# OLD WAY
'''    os.system('sudo chmod 777 -R /home/' + line + '*')
    os.system('sudo mkdir /home/' + line + '/air_dump')
    time.sleep(3)
    os.system('sudo mkdir /home/' + line + '/air_dump/dumped_files')
    time.sleep(3)
    os.system('cd ~/air_dump')
    os.system('sudo chmod 777 -R /home/' + line + '*')
# END OLD WAY

'''






def debian():
    os.system('git clone https://github.com/Bl4ckL3akz/Auto-Airodump.git')
    time.sleep(3)
    os.chdir('Auto-Airodump')
    os.system('bash air_dump-installer.sh')




def main():
    print("ConsoleLog<>> Starting installation.")
    time.sleep(1)
    print()
    print("ConsoleLog<>> Configuring.")
    conf()
    print()
    print("ConsoleLog<>> detectos.")
    print()
    time.sleep(1)



if __name__ == '__main__':
    main()
