{ pkgs, inputs, outputs, lib, ... }:
{

  imports = [ outputs.homeManagerModules.default ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "niten";
  home.homeDirectory = "/home/niten";

  myHMModules = {

    bundles.general.enable = true;
    bundles.desktop.enable = true;

    monitors = [
      {
        name = "eDP-1";
        width = 1920;
        height = 1080;
        refreshRate = 144.00101;
      }
    ];

  };

  home.stateVersion = "23.11";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

}
