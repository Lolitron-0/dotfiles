#!/bin/bash

set -e

GREEN='\033[0;32m'
BLUE='\033[1;34m'
ORANGE='\033[0;33m'
NC='\033[0m'

echo -e "$BLUE[*] Installing configuration...$NC"

CONFIGS=(hyprland kitty mako nvim rofi tmux waybar wlogout zsh)

if [ -z "$( ls -A 'submodules' )" ]; then
   echo -e "$ORANGE[!]Submodules not found, clonning$NC"
   git submodule update --init
fi

stow -v submodules
echo -e "$GREEN[+] Installed submodule configurations$NC"

for config in "${CONFIGS[@]}"; do
    if stow -v $config ; then
      echo -e "$GREEN[+] Installed $config $NC"
    else
      echo -e "$ORANGE[!] Failed to install $config $NC"
      echo -e "$ORANGE[!] Please, remove existing configs manually before running installation $NC"
    fi
done
      

echo -e "$BLUE[*] Configs installed. Bye$NC"

