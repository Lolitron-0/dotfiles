rm -rf ~/.config/nvim
rm -rf ~/.config/kitty

ln -s ~/dotfiles/nixos/modules/home-manager/features/nvim ~/.config
ln -s ~/dotfiles/nixos/modules/home-manager/features/kitty ~/.config
ln -s ~/dotfiles/nixos/modules/home-manager/features/.tmux.conf ~

echo "Links created"
