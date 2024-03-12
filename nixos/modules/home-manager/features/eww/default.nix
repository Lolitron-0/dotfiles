{ config, pkgs, lib, ... }:
let

in
{
  xdg.configFile."eww" = {
    source = ./.;
    recursive = true;
  };
}
