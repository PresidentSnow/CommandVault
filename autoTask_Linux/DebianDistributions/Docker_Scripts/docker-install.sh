#!/bin/bash

# Docker and docker compose installation automation
# on Debian and Debian-based systems

set -e
trap 'echo -e "\n ERROR!!!!: Check the steps for more details." >&2' ERR

clear_terminal(){
    echo -n "The terminal will be cleared in: "
  for i in {1..10}; do
    echo -n "${i} "
    sleep 2
  done
  echo ""
  clear
}

osSystem=$(uname -s)

if [[ "$osSystem" != "Linux" ]]; then
    echo -e "ERROR: you are NOT in a Linux system.\n"
    exit 1
fi

if [ "$EUID" -ne 0 ]; then
    echo "You must be root to do this."
    exit 1
fi

echo "Update and upgrade the package in the system."
sudo apt-get update && sudo apt-get upgrade -y
echo "Packages have been updated successfully!!"

clear_terminal

# Add oficial repository of Docker
echo "Add Docker's official GPG key..."
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

clear_terminal

# Install Docker, Docker Compose and plugins
echo "Update the apt package index."
sudo apt-get update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

clear_terminal

# Check installations
echo "Docker installed: "
docker --version
echo " "

echo "Docker-Compose Plugin installed: "
docker compose version
echo " "

echo "Status of docker service:"
systemctl is-active docker && systemctl status docker --no-pager
echo " "

echo -e "\nSuccessful installation!!"
echo "You can check it executing on the terminal: docker run hello-world"
