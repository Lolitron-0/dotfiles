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
    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        #text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        #text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        #text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        #text = "Reboot";
        keybind = "r";
      }
    ];
  };
}
