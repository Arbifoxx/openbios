#!/bin/bash

# This is currently meant to be run on a github code space. No reason it shouldn't work anywhere though.

git pull
cd ..
sudo apt-get update
sudo apt-get install -y gcc-powerpc-linux-gnu make python3 xsltproc gcc
git clone https://github.com/openbios/fcode-utils
cd fcode-utils
make
sudo make install
cd ../openbios
config/scripts/switch-arch wii-ppc
if [[ $? == 0 ]]; then
    make
fi
