#!/bin/bash
swww init && swww clear &

cfg_dir=/home/niten/dotfiles/nixos/modules/home-manager/features/hyprland

sleep 3
swww img $cfg_dir/Snow-valley.jpg &
sleep 4

nm-applet --indicator & 
blueman-applet &
hyprctl setcursor Bibata-Modern-Ice 16 &
