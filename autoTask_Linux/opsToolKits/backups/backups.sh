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

read -p "Enter the backup file: " backup
echo -e "Analysing the backup file...\n"

if [[ ! -s $backup ]]; then
  echo -e "ERROR: Numerous incorrect parameters, can only pass 1.\n"
  exit 1
fi

if [[ ! -f $backup ]]; then
  echo -e "ERROR: The document passed is NOT a regular file or does not exist.\n"
  exit 1
fi

if [[ ! -e /backups ]]; then
  echo -e "La carpeta backups NO existe.\n"
  echo -e "Creando...\n"
  mkdir /backups
  echo -e "Carpeta creada.\n"
else
  echo -e "La carpeta backups existe.\n"
fi

# Traverse the file
while read line; do
  if [[ -d $line ]]; then
    echo "The file path exists: $line"
    echo -e "Compressing the file to .tar.gz..."
    folderbk=$(basename "$line")
    tar -cvzf "/backups/$folderbk.tar.gz" "$line"
    echo " "
    echo -e "The file $line has been compressed to /backups/$folderbk.tar.gz.\n"
  else
    echo -e "The file path does NOT exist: $line\n"
  fi
done < "$backup"
