#!/bin/bash -e

on_chroot << EOF
  if [ ! -d "/usr/share/piportal" ]; then
     mkdir /usr/share/piportal
  fi
EOF

install -m 644 files/DHF-Background.png "${ROOTFS_DIR}/usr/share/piportal/DHF-Background.png"

on_chroot << EOF
   rm -f /etc/xdg/autostart/piwiz.desktop
   sed -i 's/^wallpaper=.*$/wallpaper=\/usr\/share\/piportal\/DHF-Background\.png/' /etc/lightdm/pi-greeter.conf
#   kill $(ps aux | grep '[p]iwiz' | awk '{print $2}')
#   wget -q http://dhf-software.s3.amazonaws.com/DHF-Background.png -O /home/pi/DHF-Background.png
#   pcmanfm --set-wallpaper /home/pi/DHF-Background.png 
#   cp /home/pi/DHF-Background.png /usr/share/plymouth/themes/pix/splash.png
#    ln -fs /home/pi/DHF-Background.png /etc/alternatives/desktop-background

EOF

