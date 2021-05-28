#!/bin/bash
echo "Welcome to Shankar's featherOS install script!"
echo "Please enter the username"
read varuser
id -u $varuser > /dev/null
if [ $? -ne 0 ]; then
	echo "The user is not valid"
	exit -1
fi
apt -y install build-essential libx11-dev libxinerama-dev libxft-dev \
               git wget xinit xserver-xorg zsh x11-xserver-utils \
	       fonts-font-awesome chromium curl
git clone https://github.com/sgomare/featherOS.git /opt/featherOS/ 
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
cp .xinitrc /home/$varuser/.xinitrc
cp ./dircolors-solarized/dircolors.256dark /home/$varuser/.dir_colors 
