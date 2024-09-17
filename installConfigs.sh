pip install powerline-shell

echo "Don't forget to add powerline!"
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }
#
# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k || true
git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh || true


rm -rf ~/.local/share/mc/skins
mkdir -p ~/.local/share/mc/skins && cd ~/.local/share/mc/skins
	mc_dracula_path=~/dotfiles/nixos/modules/home-manager/features/mc/mc-dracula-theme/skins
	ln -s ${mc_dracula_path}/dracula.ini
	ln -s ${mc_dracula_path}/dracula256.ini
cd -

rm -rf ~/.config/nvim
rm -rf ~/.config/kitty
rm -rf ~/.config/powerline-shell

ln -s ~/dotfiles/nixos/modules/home-manager/features/nvim ~/.config
ln -s ~/dotfiles/nixos/modules/home-manager/features/kitty ~/.config

rm -rf ~/.config/waybar
ln -s ~/dotfiles/nixos/modules/home-manager/features/waybar ~/.config

rm -rf ~/.config/wlogout
ln -s ~/dotfiles/nixos/modules/home-manager/features/wlogout ~/.config

rm -rf ~/.config/rofi
ln -s ~/dotfiles/nixos/modules/home-manager/features/rofi ~/.config

rm -rf ~/.config/mako
ln -s ~/dotfiles/nixos/modules/home-manager/features/mako ~/.config

rm -f ~/.config/hypr/hyprland.conf
ln -s ~/dotfiles/nixos/modules/home-manager/features/hyprland/hyprland.conf ~/.config/hypr

ln -s ~/dotfiles/nixos/modules/home-manager/features/powerline-shell ~/.config

rm -rf ~/.tmux.conf
ln -s ~/dotfiles/nixos/modules/home-manager/features/.tmux.conf ~

rm ~/.zshrc
rm -r ~/.oh-my-zsh/custom
ln -s ~/dotfiles/nixos/modules/home-manager/features/zsh/.zshrc ~
ln -s ~/dotfiles/nixos/modules/home-manager/features/zsh/custom ~/.oh-my-zsh

echo "Links created"

