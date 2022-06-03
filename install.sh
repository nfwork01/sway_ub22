#!/bin/bash

# Pre check
if [ "$0" != "./install.sh" ]; then
  echo "Run this script at the sway_ub22 directory."
  exit 1
fi
sudo apt update

# OS Setting
sudo timedatectl set-timezone Asia/Tokyo

# Security
sudo ufw enable

# Sway
sudo apt install --no-install-recommends sway
sudo apt install fzf

# i3blocks
sudo apt install i3blocks
DIR_ORG=$PWD
mkdir -p ~/.config/i3blocks
cd ~/.config/i3blocks
git clone https://github.com/vivien/i3blocks-contrib
cd $DIR_ORG


# Browser
sudo apt install firefox fonts-noto-cjk
sudo apt instlll --no-install-recommends apt install xdg-desktop-portal-gtk

# Input Japanese
sudo apt install --no-install-recommends fcitx5-mozc fcitx5-config-qt qtwayland5 mozc-utils-gui
sudo apt install --no-install-recommends fcitx5-module-wayland fcitx5-module-xorg fcitx5-frontend-gtk3
sudo bash -c "echo -e \"export GTK_IM_MODULE=fcitx\nexport QT_IM_MODULE=fcitx\nexport XMODIFIERS=@im=fcitx\" >> /etc/environment"

# Audio
sudo apt install alsa-base pulseaudio

# Snapshot
sudo apt install --no-install-recommends grim slurp
sudo apt install --no-install-recommends wf-recorder

# KVM
sudo apt install qemu-system-x86 libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager

# Configurations
mkdir -p ~/.config/sway
mkdir -p ~/.config/i3blocks
mkdir -p ~/.local/bin

cp ./config/sway/config ~/.config/sway/
cp ./config/i3blocks/config ~/.config/i3blocks/
cp ./local/bin/* ~/.local/bin/
