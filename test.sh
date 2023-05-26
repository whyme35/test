#!/bin/bash

sudo apt update
sudo apt install -y \
  gnupg lsb-release software-properties-common \
  apt-transport-https ca-certificates curl

# Add the key for docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the repository using key we just downloaded.
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# Finally, install docker from the repository.
sudo apt update
sudo apt install -y \
  docker-ce docker-ce-cli containerd.io docker-compose-plugin


# Add the current user to docker so that you can
# execute docker commands without using sudo
sudo usermod -aG docker $USER

