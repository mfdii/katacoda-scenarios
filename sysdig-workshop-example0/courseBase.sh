#!/bin/bash

#Install Sysdig

echo ""
curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | sudo bash > /dev/null

#Install Kernel Module
modprobe sysdig-probe

#start nginx
docker-compose up -d 

