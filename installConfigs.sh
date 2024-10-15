#!/bin/bash

set -e

#todo:tmux

stow submodules

stow	btop \
			hyprland \
			kitty \
			mako \
			nvim \
			rofi \
			tmux \
			waybar \
			wlogout \
			zsh
			

echo "Links created"

