{ pkgs, config, inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.colorSchemes.ocean;

  myHMModules = {
    nvim.enable = true;
    bash.enable = true;
  };

  programs = {
    git = {
      enable = true;
      userName = "Lolitron-0";
      userEmail = "ovcharov_05@mail.ru";
    };

  };

  home.packages = with pkgs; [
    kitty
    kitty-themes

    libnotify
    lsd
    nil
    nixpkgs-fmt
    wl-clipboard
	killall

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.home-manager.enable = true;
}
