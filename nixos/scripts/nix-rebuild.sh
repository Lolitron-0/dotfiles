#!/usr/bin/env bash

set -e

pushd ~/dotfiles

echo "NixOS rebuilding..."

sudo nixos-rebuild switch --flake ~/dotfiles/nixos#default

current=$(nixos-rebuild list-generations | grep current)

if [[ $* != *-t* ]]
then
	git add .
	git commit -am "$current"
fi

popd

notify-send -e "NixOS rebuilt OK!" -t 600 --icon=software-update-available
