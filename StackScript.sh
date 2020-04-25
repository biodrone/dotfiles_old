#!/bin/bash

# <UDF name="GOLANG_INSTALL" Label="Install GO?" default="n" example="y/n" />
# <UDF name="HOSTNAME" Label="Hostname of New Server?" default="localhost" example="new-linode-vps" />

#Install Dotfiles

mkdir /var/log/linode

echo "\nINSTALLING DOTFILES\n" >> /var/log/linode/setup.log

git clone https://github.com/biodrone/dotfiles /opt/dotfiles

cd /opt/dotfiles

bash setup.sh >> /var/log/linode/setup.log

#Check if GO is required

if [ "$GOLANG_INSTALL" == "y" ]; then

    echo "INSTALLING GO 1.14.2\n" >> /var/log/linode/setup.log

    git clone https://github.com/biodrone/build-scripts /opt/build-scripts

    cd /opt/build-scripts && chmod +x *

    bash golang-1.14.2-amd64.sh >> /var/log/linode/setup.log

fi

# Check if hostname change is required

if [ "$HOSTNAME" != "localhost" ]; then
    echo "Changing Hostname to $HOSTNAME" >> /var/log/linode/setup.log

    sed -i "s/localhost/$HOSTNAME/g" /etc/hostname

    sed -i "s/127.0.0.1\tlocalhost/127.0.0.1\tlocalhost\n127.0.1.1\t$HOSTNAME\n/g" /etc/hosts

fi

#Cleanup Build Scripts

rm -R /opt/build-scripts

#Bounce

reboot