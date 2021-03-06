#!/bin/bash
set -ex

#install docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

DOCKER_VERSION=5:19.03.14~3-0~ubuntu-bionic
sudo apt-get update
sudo apt-get install -y --allow-downgrades docker-ce=${DOCKER_VERSION} docker-ce-cli=${DOCKER_VERSION} containerd.io

sudo usermod -aG docker user
