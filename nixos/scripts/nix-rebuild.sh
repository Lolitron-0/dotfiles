#!/usr/bin/env bash

set -e

pushd ~/dotfiles

echo "NixOS rebuilding..."


if [[ $* != *-t* ]]
then
	sudo nixos-rebuild switch --flake ~/dotfiles/nixos#default
	current=$(nixos-rebuild list-generations | grep current)
	git add .
	git commit -am "$current"
else
	sudo nixos-rebuild test --flake ~/dotfiles/nixos#default
fi

popd

notify-send -e "NixOS rebuilt OK!" -t 1000 --icon=software-update-available
echo "Done!"
