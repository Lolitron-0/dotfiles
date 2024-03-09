{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark Hard";
    settings = {
      enable_audio_bell = false;
	  background_opacity = "0.65";
    };
  };
}
