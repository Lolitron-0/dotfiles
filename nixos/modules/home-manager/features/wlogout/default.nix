{ pkgs
, config
, ...
}:
let
  styleString = (builtins.replaceStrings
    [ "./" ]
    [ ((builtins.toString ./.) + "/") ]
    (builtins.readFile ./style.css));
in
{
  programs.wlogout = {
    enable = true;
    style = styleString;
  };
}
