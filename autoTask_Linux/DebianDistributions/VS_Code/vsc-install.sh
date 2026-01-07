#!/bin/bash

# VS Code installation automation on
# Debian and Debian-based systems

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
echo -e "Packages have been updated successfully!!\n"

clear_terminal

echo "Installing dependencies..."
sudo apt-get install software-properties-common apt-transport-https wget -y
echo " "

# Import the Microsoft GPG key
echo "Importing Microsoft GPG keys..."
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
echo -e "Process completed.\n"

clear_terminal

echo "Instalando el paquetes de VSC (code)..."
sudo apt-get install code
echo -e "Instalado con exito!!\n"

clear_terminal

echo "Updating VSC packages..."
sudo apt-get update && sudo apt-get upgrade -y
echo "System packages successfully updated!!"
echo "VS Code successfully installed!!"