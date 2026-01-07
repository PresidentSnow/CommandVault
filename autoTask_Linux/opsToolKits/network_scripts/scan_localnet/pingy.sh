#!/bin/bash

set -e
trap 'echo -e "\n ERROR!!!!: Check the steps for more details." >&2' ERR

osSystem=$(uname -s)

if [[ "$osSystem" != "Linux" ]]; then
    echo -e "ERROR: you are NOT in a Linux system.\n"
    exit 1
fi

if [ "$EUID" -ne 0 ]; then
    echo "You must be root to do this."
    exit 1
fi

# Obtain the octets of the IPv4 address
ifconfig | grep "broadcast" | cut -d " " -f 10 | grep "^192\.168\." | cut -d "." -f 1,2,3 | uniq > octets.txt

OCTETS=$(cat octets.txt)
echo " " > $OCTETS.txt

# Loop
for ip in {1..254}; do
  ping -c 1 $OCTETS.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> $OCTETS.txt &
done

# Show octets file
cat $OCTETS.txt | sort -nr > sorted_$OCTETS.txt
echo " "

# Scan
nmap -sS --top-ports 20 -iL sorted_$OCTETS.txt

exit
