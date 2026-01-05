#!/bin/bash 

# Docker and docker compose uninstallation
# automation on Debian and Debian-based systems

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

echo "Stopping and eliminating docker containers..."

if command -v docker &> /dev/null; then

    CONTAINERS=$(sudo docker ps -aq)
    
    [ -n "$CONTAINERS" ] && sudo docker stop $CONTAINERS 2>/dev/null
    [ -n "$CONTAINERS" ] && sudo docker rm $CONTAINERS 2>/dev/null

    sudo docker rm $(sudo docker ps -aq) 2>/dev/null

else
    echo -e "Docker is not installed, skipping this step.\n"
fi

echo "Uninstalling Docker..."
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc;
    do sudo apt-get remove $pkg;
done
echo -e "Docker successfully uninstalled!!\n"

echo "Removing images, containers and volumes of Docker..."
sudo rm -r /var/lib/docker
sudo rm -r /var/lib/containerd
sudo rm -r /etc/docker
sudo rm /etc/apt/sources.list.d/docker.list
sudo rm /etc/apt/keyrings/docker.asc
echo " "

echo "Deleting Docker group"
groupdel docker
echo -e "Docker group deleted successfully!!\n"

clear_terminal

# Docker compose

# Check if docker compose has already installed
if sudo apt list --installed 2>/dev/null | grep -q docker-compose-plugin; then
    echo "Uninstalling Docker Compose Plugin..."
    sudo apt-get purge -y docker-compose-plugin
    echo -e "Docker compose plugin uninstalled!!\n"
fi

# Check docker compose binary
if [ -f /usr/local/bin/docker-compose ] || command -v docker-compose &>/dev/null; then
    echo "Uninstalling docker compose binary..."
    sudo rm -r /usr/local/bin/docker-compose
    sudo rm -r /usr/bin/docker-compose
fi
echo " "

echo "Cleaning unused packages..."
sudo apt-get autoremove -y

clear_terminal

echo -e "\nChecking uninstall process: "

if ! command -v docker 2>/dev/null; then
    echo -e "Docker was successfully uninstalled.\n"
else
    docker --version
    echo -e "ERROR: Docker was not successfully uninstalled...\n"
fi

if ! command -v docker-compose &>/dev/null && ! docker compose version &>/dev/null; then
    echo -e "Docker Compose has been successfully uninstalled.\n"
else
    if command -v docker-compose &>/dev/null; then
        docker-compose --version
    fi
    if docker compose version &>/dev/null; then
        docker compose version
    fi
    echo -e "ERROR: Docker Compose has not been completely uninstalled.\n"
fi

echo "Docker and Docker Compose have been successfully uninstalled!!"