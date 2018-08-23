#!/bin/bash

#Install Sysdig
echo "* Installing Sysdig, this may take a few minutes"
curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | sudo bash > /dev/null

#Install Kernel Module
echo "* Loading kernel module"
modprobe sysdig-probe

#location to store captures.
echo "* create capture directory"
mkdir captures
chown 1000:1000 captures

#start nginx and sysdig inspect
echo "* Starting containers for scenario"
docker-compose up -d 


echo "* Setup complete"

