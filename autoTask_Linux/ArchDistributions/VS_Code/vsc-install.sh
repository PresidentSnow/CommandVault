#!/bin/zsh

# VS Code installation automation on
# Arch and Arch-based systems systems

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

if [ "$EUID" -ne 0 ]; then
    echo "You must be root to do this."
    exit 1
fi

echo "Update and upgrade the package in the system."
sudo pacman -Syu --noconfirm
echo "Packages have been updated successfully!!"

clear_terminal

# git and base-devel install
echo "Installing git y base-devel..."
sudo pacman -S --needed base-devel git --noconfirm
echo "Process completed!!"

# VS Code install
echo "Installing vs code using 'yay'..."
yay -S visual-studio-code-bin --noconfirm
echo " "

echo "Everything completed successfully!!"