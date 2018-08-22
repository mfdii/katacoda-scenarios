#!/bin/bash

#Install Sysdig
echo "* Installing Sysdig, this may take a few minutes"
curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | sudo bash > /dev/null

#Install Kernel Module
echo "* Loading kernel module"
modprobe sysdig-probe

#start nginx
echo "* Starting nginx"
docker-compose up -d 

echo "* Setup complete"

