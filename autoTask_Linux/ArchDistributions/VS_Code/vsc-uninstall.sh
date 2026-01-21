#!/bin/bash

# VS Code uninstallation automation on
# Arch and Arch-based systems

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

echo "Uninstalling VSC on Arch..."
sudo pacman -R visual-studio-code-bin
echo -e "Process completed successfully!!\n"
