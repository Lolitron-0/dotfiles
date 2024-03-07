{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark";
    settings = {
      enable_audio_bell = false;
    };
  };
}
