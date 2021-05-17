{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ capitaine-cursors ];

  xresources.properties = {
    "Xcursor.theme" = "Capitaine Cursors";
    "cursor.theme" = "Capitaine Cursors";
    "Xcursor.size" = "24";
    "cursor.size" = "24";

    "*background" = "#080808";
    "*foreground" = "#ffffff";
    "*fading" = "60";
    "*color0" = "#c6c6c6";
    "*color1" = "#dc322f";
    "*color2" = "#859900";
    "*color3" = "#b58900";
    "*color4" = "#268bd2";
    "*color5" = "#d33682";
    "*color6" = "#2aa198";
    "*color7" = "#eee8d5";
    "*color8" = "#505050";
    "*color9" = "#cb4b16";
    "*color10" = "#586e75";
    "*color11" = "#657b83";
    "*color12" = "#ffffff";
    "*color13" = "#6c71c4";
    "*color14" = "#93a1a1";
    "*color15" = "#fdf6e3";
  };
}
