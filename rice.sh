#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]
  then printf "The script has to be run as root.\n"
  exit
fi

cd ..
userhome=$(pwd)

xbps-install -y pkg-config xorg-server xinit base-devel libX11-devel libXft-devel libXinerama-devel feh unclutter unzip font-awesome font-hack-ttf
printf "installed dependencies\n"

mkdir /etc/rice/
mv $userhome/voidrice/rice.zip /etc/rice/
mv $userhome/voidrice/dots.zip /$userhome
printf "moved zips\n"

cd /$userhome
unzip dots.zip
cd /etc/rice
unzip rice.zip
printf "unzipped\n"

cd /etc/rice/dwm
make clean install
printf "installed dwm\n"
cd /etc/rice/dmenu
make clean install
printf "installed dmenu\n"
cd /etc/rice/slstatus
make clean install
printf "installed slstatus\n"
cd /etc/rice/st
make clean install
printf "installed st\n"


printf "Install finished.\n"
