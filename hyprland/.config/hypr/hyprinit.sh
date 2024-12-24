#!/bin/bash
hyprctl setcursor Bibata-Modern-Ice 24
swww-daemon --no-cache &

cfg_dir=$HOME/.config/hypr

openrgb --server &
openrgb -p my
swww img ${cfg_dir}/Snow-valley.jpg
sleep 3

waybar &
nm-applet --indicator & 
blueman-applet &
