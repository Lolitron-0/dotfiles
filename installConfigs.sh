#!/bin/bash

set -e

if [ -z "$( ls -A 'submodules' )" ]; then
   echo "Submodules not found, clonning"
   git submodule update --init
fi

stow submodules

stow  hyprland \
      kitty \
      mako \
      nvim \
      rofi \
      tmux \
      waybar \
      wlogout \
      zsh
      

echo "Links created"

