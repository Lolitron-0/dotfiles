#!/bin/bash

set -e

GREEN='\033[0;32m'
BLUE='\033[1;34m'
ORANGE='\033[0;33m'
NC='\033[0m'

SUPPORTED_CONFIGS=(
  hyprland
  kitty
  mako
  nvim
  rofi
  tmux
  waybar
  wlogout
  zsh
)

if [[ $# -eq 0 ]] || [[ $1 == '-h' ]]; then
   echo -e "Usage: 
\t$ORANGE$0 <option> [arguments...]$NC
Available options:
-h\t\t\tShow this message
-a\t\t\tInstall all configs
-s [configs...]\t\tInstall specific configs.\n\t\t\tSupported values:"
for config in "${SUPPORTED_CONFIGS[@]}"; do
  echo -e "\t\t\t- $config"
done
   exit
fi


CONFIGS=(${SUPPORTED_CONFIGS[@]})
if [[ $1 == "-s" ]]; then
  CONFIGS=( ${@:2} )
  for config in "${CONFIGS[@]}"; do
    match=0
    for supported in "${SUPPORTED_CONFIGS[@]}"; do
      if [[ $config == $supported ]]; then
        match=1
      fi
    done
    if [[ $match -eq 0 ]]; then
      echo -e "$ORANGE[!] Unsupported config: $config$NC"
      exit 1
    fi
  done
fi

echo -e "$BLUE[*] Installing following configs:$NC"
for config in "${CONFIGS[@]}"; do
  echo -e "- $config"
done


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

