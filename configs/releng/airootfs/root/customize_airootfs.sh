#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target

#### Customization ####
# Enable NetworkManager
systemctl enable NetworkManager.service

# Create non sudo user in wheel group
useradd -mG wheel sweenu
sed -i '/# %wheel ALL=(ALL) NOPASSWD: ALL/s/^#//g' /etc/sudoers

## As user sweenu ##
su sweenu
# Clone setup repo
git clone https://github.com/Sweenu/setup /home/sweenu/setup

# Install pikaur using itself
git clone https://github.com/actionless/pikaur /home/sweenu/pikaur
python /home/sweenu/pikaur/pikaur.py -S pikaur --noconfirm
