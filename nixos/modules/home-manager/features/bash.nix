{ pkgs, config, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "lsd";
      nrb = "bash ~/dotfiles/nixos/scripts/nix-rebuild.sh";
      ncf = "bash ~/dotfiles/nixos/scripts/nix-configure.sh";
    };
  };

  home.packages = with pkgs; [

    (writeShellScriptBin
      "gittok"
      ''
        	  	xclip < ~/git_token
      '')
  ];
}
