#!/bin/bash
apt -y install build-essential libx11-dev libxinerama-dev libxft-dev \
               git wget xinit xserver-xorg zsh x11-xserver-utils \
	       fonts-font-awesome chromium curl
chsh -s /bin/zsh
git clone https://github.com/sgomare/featherOS.git /opt/featherOS/ 
cd /opt/featherOS/dwm-6.2/
make clean install
cd ../st-0.8.4
make clean install
cd ../dmenu-5.0
make clean install
cd ../dwmstatus
make clean install
cd ../
cp .zshrc ~/.zshrc
cp .xinitrc ~/.xinitrc
cp ./dircolors-solarized/dircolors.256dark ~/.dir_colors 
