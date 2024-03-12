{ pkgs, config, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "lsd";
      nrb = "bash ~/dotfiles/nixos/scripts/nix-rebuild.sh";
      ncf = "bash ~/dotfiles/nixos/scripts/nix-configure.sh";
      wbre = ''
        	  killall -r .*waybar.*
        	  waybar &
        	  exit
        	  '';
    };
    bashrcExtra = ''unset SSH_ASKPASS'';
    historyControl = [ "erasedups" ];
  };

  home.packages = with pkgs; [
    xclip

    (writeShellScriptBin
      "gittok"
      ''
        	  	wl-copy < ~/git_token
      '')
  ];
}
