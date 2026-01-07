#!/bin/bash

# ---------------
# INFOUSERS.SH
# ---------------

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

# Check parameter number
if ! [[ $# -eq 1 ]]
then
   echo -e "ERROR: Parameter number wrong, you must introduce just one file.\n"
   exit 1
fi

# Check existing file
if ! [[ -f $1 ]]
then
   echo "ERROR: The file "$1" doesn't exist or is not a regular file."
   exit 1
fi

while read USER
do
   if ! [[ $USER = "" ]]
   then
      if [[ "$(grep -c  "$USER:" /etc/passwd)" -eq 1 ]]
      then
	      echo "User $USER"
	      echo "  " Name: "$(grep "$USER:" /etc/passwd | cut -d':' -f1)"
	      echo "  " Directory: "$(grep "$USER:" /etc/passwd | cut -d':' -f6)"
	      echo "  " Shell: "$(grep "$USER:" /etc/passwd | cut -d':' -f7)"
         echo " "
      else
	      echo -e "The user $USER doesn't exist...\n"
      fi
   fi
done < $1