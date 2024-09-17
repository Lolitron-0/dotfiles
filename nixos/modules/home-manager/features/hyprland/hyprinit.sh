#!/bin/bash
swww-daemon --no-cache &

cfg_dir=/home/niten/dotfiles/nixos/modules/home-manager/features/hyprland

swww img ${cfg_dir}/Snow-valley.jpg
sleep 3

waybar &
hyprctl setcursor Bibata-Modern-Ice 24
nm-applet --indicator & 
blueman-applet &
