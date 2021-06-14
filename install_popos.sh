#!/bin/bash
echo "Welcome to Shankar's featherOS install script!"
echo "Please enter the username"
read varuser
id -u $varuser > /dev/null
if [ $? -ne 0 ]; then
	echo "The user is not valid"
	exit -1
fi
apt --allow-remove-essential -y purge pop-desktop gnome-shell
apt -y autoremove
apt -y install build-essential libx11-dev libxinerama-dev libxft-dev \
               git wget xinit xserver-xorg zsh x11-xserver-utils \
	       fonts-font-awesome chromium curl compton nitrogen
cp ./blacklistpopos /etc/apt/preferences.d/
cp ./blacklistgnome /etc/apt/preferences.d/
cd /opt/featherOS/dwm-6.2/
make clean install
make clean
cd ../st-0.8.4
make clean install
make clean
cd ../dmenu-5.0
make clean install
make clean
cd ../dwmstatus
make clean install
make clean
cd ../
chsh -s /bin/zsh $varuser
cp .zshrc /home/$varuser/.zshrc
chown $varuser.$varuser /home/$varuser/.zshrc
cp .xinitrc /home/$varuser/.xinitrc
chown $varuser.$varuser /home/$varuser/.xinitrc
cp ./dircolors-solarized/dircolors.256dark /home/$varuser/.dir_colors
