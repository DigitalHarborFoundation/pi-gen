#!/bin/bash -e

on_chroot << EOF
   rm /etc/xdg/autostart/piwiz.desktop
   kill $(ps aux | grep '[p]iwiz' | awk '{print $2}')
   wget -q http://dhf-software.s3.amazonaws.com/DHF-Background.png -O /home/pi/DHF-Background.png
   pcmanfm --set-wallpaper /home/pi/DHF-Background.png 

EOF
