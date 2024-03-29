#!/bin/bash

# RUN after installing ARCH with profile XORG

function download_basic_tools(){
    sudo pacman -S git python make gcc wget libxft libxinerama ttf-dejavu
}

function download_and_install_DWM(){
    git clone git://git.suckless.org/dwm;
    cd dwm;
    sudo pacman -Fy;
    pacman -F Xft.h;
    make clean;
    make all clean;
    sudo make clean install;
    touch ~/.xinitrc
    echo "exec dwm" >> ~/.xinitrc
    cd ~;
}

download_basic_tools
download_and_install_DWM