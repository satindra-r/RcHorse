#!/bin/bash
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo apt remove -y openssh-server

sudo dnf remove -y openssh-server

sudo pacman -R --noconfirm openssh