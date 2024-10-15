{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Kaolin Dark";
    settings = {
      enable_audio_bell = false;
	  background_opacity = "0.65";
    };
  };
}
