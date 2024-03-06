#!/usr/bin/env bash

set -e

# bruh
sudo echo

pushd ~/dotfiles

$EDITOR

echo "NixOS rebuilding..."

sudo nixos-rebuild switch --flake ~/dotfiles/nixos#default

current=$(nixos-rebuild list-generations | grep current)

git add .
git commit -am "$current"

popd

notify-send -e "NixOS rebuilt OK!" -t 600 --icon=software-update-available
