#!/bin/bash
echo "Welcome to Shankar's featherOS install script!"
echo "Please enter the username"
read varuser
id -u $varuser > /dev/null
if [ $? -ne 0 ]; then
        echo "The user is not valid"
        exit -1
fi
sudo dnf install git make automake gcc gcc-c++ kernel-devel \
                 libX11-devel libXinerama-devel libXft-devel \
                 xorg-x11-server-Xorg xinit zsh fontawesome-fonts \
                 fontawesome-fonts-web chromium curl compton nitrogen
cd /opt/featherOS/dwm-6.2/
make clean install
make clean
cd ../st-0.8.4
make clean install
make clean
cd ../dmenu-5.0
make clean install
make clean
cd ../slstatus
make clean install
make clean
cd ../
chsh -s /bin/zsh $varuser
cp .zshrc /home/$varuser/.zshrc
chown $varuser.$varuser /home/$varuser/.zshrc
cp .xinitrc /home/$varuser/.xinitrc
chown $varuser.$varuser /home/$varuser/.xinitrc
cp ./dircolors-solarized/dircolors.256dark /home/$varuser/.dir_colors
