#!/bin/bash

# Determine Envionment
#declare $(awk -F= '$1=="ID_LIKE" { print "CURRENTENV=" $2 ;}' /etc/os-release)

# Update/Upgrade
sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Install useful packages
sudo DEBIAN_FRONTEND=noninteractive apt install -y python3 python3-pip git curl zsh screen tmux htop iftop gpg xsel mosh apt-transport-https ca-certificates gnupg-agent software-properties-common fonts-powerline linuxlogo lolcat neovim

# Useful pip installs
sudo pip3 install poetry

# Copy TMUX config
cp /opt/dotfiles/.tmux.conf ~

# Install TMUX Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux new ~/.tmux/plugins/tpm/bin/install_plugins

# Install docker and docker-compose
curl -fsSL https://get.docker.com -o /opt/dotfiles/get-docker.sh
sh /opt/dotfiles/get-docker.sh
sudo apt install -y docker-compose

# Add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# Install OhMyZshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# OMZ Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy OMZ config
rm ~/.zshrc
cp /opt/dotfiles/.zshrc ~

# Clean up files/dirs
(crontab -l 2>/dev/null; echo "@reboot (rm -R /opt/dotfiles)") | crontab -

# Change shell to zsh
sudo chsh -s $(which zsh)
