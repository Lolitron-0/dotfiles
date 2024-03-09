{
  bind = [
    "$mainMod, return, exec, $terminal"
    "$mainMod, Q, killactive,"
    "$mainMod SHIFT, M, exit,"
    "$mainMod SHIFT, F, togglefloating,"
    "$mainMod, F, fullscreen,1"
    "$mainMod, R, exec, $menu"
    "$mainMod, P, pseudo," # dwindle
    "$mainMod, S, togglesplit," # dwindle

    "$mainMod, T, exec, hyprctl --batch \"dispatch exec kitty --execute pipes.sh;dispatch exec kitty --execute btop -p 2;dispatch exec kitty;\""
    "ALT, Tab, workspace,e+1"
    "ALT, Tab, bringactivetotop,"

    "$mainMod, left, movefocus, l"
    "$mainMod, right, movefocus, r"
    "$mainMod, up, movefocus, u"
    "$mainMod, down, movefocus, d"

    "$mainMod, h, movefocus, l"
    "$mainMod, l, movefocus, r"
    "$mainMod, k, movefocus, u"
    "$mainMod, j, movefocus, d"

    "$mainMod SHIFT, h, movewindow, l"
    "$mainMod SHIFT, l, movewindow, r"
    "$mainMod SHIFT, k, movewindow, u"
    "$mainMod SHIFT, j, movewindow, d"

    "bind = $mainMod, mouse_down, workspace, e+1"
    "bind = $mainMod, mouse_up, workspace, e-1"
  ]
  ++ map
    (n: "$mainMod SHIFT, ${toString n}, movetoworkspace, ${toString (
            if n == 0
            then 10
            else n
          )}") [ 1 2 3 4 5 6 7 8 9 0 ]
  ++ map
    (n: "$mainMod, ${toString n}, workspace, ${toString (
            if n == 0
            then 10
            else n
          )}") [ 1 2 3 4 5 6 7 8 9 0 ];

  binde = [
    "$mainMod SHIFT, h, moveactive, -20 0"
    "$mainMod SHIFT, l, moveactive, 20 0"
    "$mainMod SHIFT, k, moveactive, 0 -20"
    "$mainMod SHIFT, j, moveactive, 0 20"

    "$mainMod CTRL, l, resizeactive, 30 0"
    "$mainMod CTRL, h, resizeactive, -30 0"
    "$mainMod CTRL, k, resizeactive, 0 -10"
    "$mainMod CTRL, j, resizeactive, 0 10"
  ];
  bindm = [
    # Move/resize windows with mainMod + LMB/RMB and dragging
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
