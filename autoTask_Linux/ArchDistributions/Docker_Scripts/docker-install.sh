#!/bin/bash

# Docker and docker compose installation
# automation on Arch and Arch-based systems

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

if [[ "$osSystem" != "Linux" ]]; then
    echo -e "ERROR: you are NOT in a Linux system.\n"
    exit 1
fi

if [ "$EUID" -ne 0 ]; then
    echo "You must be root to do this."
    exit 1
fi

echo "Update and upgrade the package in the system..."
sudo pacman -Syu --noconfirm
echo "Packages have been updated succesfully!!"

clear_terminal

echo "Installing Docker and Docker Compose..."
sudo pacman -S docker 
sudo pacman -S docker-compose
echo "Docker and docker compose have been installed succesfully!!"

clear_terminal

echo "Enabling docker service..."
sudo systemctl enable --now docker.service

# Verificar las instalaciones
echo -e "\nDocker installed:"
docker --version

echo "Docker Compose installed:"
docker compose --version

echo -e "\nInstallation completed successfully!"
echo "You can test Docker by running: docker run hello-world"
echo "NOTE: For group changes to take effect, you will need to log out and log back in."