#!/bin/bash

# Determine Envionment
declare $(awk -F= '$1=="ID_LIKE" { print "CURRENTENV=" $2 ;}' /etc/os-release)

# Update/Upgrade
sudo apt update && sudo apt upgrade -y

# Install useful packages
sudo DEBIAN_FRONTEND=noninteractive apt install -y python3 python3-pip git curl zsh screen tmux htop iftop gpg xsel mosh apt-transport-https ca-certificates gnupg-agent software-properties-common fonts-powerline

# Useful pip installs
sudo pip3 install requests twisted beautifulsoup4 scapy scrapy ipython

# Install ZeroTier (the secure way)
curl -s 'https://raw.githubusercontent.com/zerotier/download.zerotier.com/master/htdocs/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi

# Join My ZeroTier Network
sudo zerotier-cli join 12ac4a1e719def45

# Copy TMUX config
cp /opt/dotfiles/.tmux.conf ~

# Install TMUX Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

# Install docker
curl -fsSL https://get.docker.com -o ~/opt/dotfiles/get-docker.sh
sh /opt/dotfiles/get-docker.sh

# Install OhMyZshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# OMZ Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy OMZ config
rm ~/.zshrc
cp /opt/dotfiles/.zshrc ~
source ~/.zshrc

# Clean up files/dirs
(crontab -l 2>/dev/null; echo "@reboot (rm -R /opt/dotfiles)") | crontab -

# Change shell to zsh
chsh -s $(which zsh)

# Reboot
sudo reboot
