#!/bin/bash
#Installing Docker
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -ec2-35-90-9-119.us-west-2.compute.amazonaws.com 
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
sudo apt-get update
sudo apt-get install docker-ce -y
sudo systemctl enable docker
sudo systemctl restart docker
docker build -t docker-nginx .
docker run -d -p 80:80 --name=docker-nginx --health-cmd='stat /usr/share/nginx/html/index.html || exit 1' --health-interval=10s --health-start-period=3m nginx


