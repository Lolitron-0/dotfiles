rm -rf ~/.config/nvim
rm -rf ~/.config/kitty

ln -s ./nixos/modules/home-manager/features/nvim ~/.config
ln -s ./nixos/modules/home-manager/features/kitty ~/.config

echo "Links created"
