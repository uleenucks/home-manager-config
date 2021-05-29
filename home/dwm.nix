{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ dmenu libnotify i3lock ];

  home.file = {
    ".dwm/autostart.sh" = {
      executable = true;
      text = ''
        #!/bin/sh
        ${pkgs.dunst}/bin/dunst &
        xrandr --output DP-2 --auto --left-of eDP-1 --auto --primary
      '';
    };

    ".config/dunst/dunstrc".source = ./dunstrc;
    ".config/i3status/config".source = ./i3statusconf;
    ".config/alacritty/alacritty.yml".source = ./alacrittyconf;
  };
}
