#!/bin/bash
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo apt remove -y openssh-server
sudo apt remove -y ufw

sudo dnf remove -y openssh-server
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --reload

sudo pacman -R --noconfirm openssh
sudo pacman -R --noconfirm ufw