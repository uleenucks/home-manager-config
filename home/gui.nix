{ config, pkgs, ... }:

let
  nur-no-pkgs = import (builtins.fetchTarball
    "https://github.com/nix-community/NUR/archiver/master.tar.gz") { };
in {
  imports = with nur-no-pkgs.repos.uleenucks.modules; [
    ./dwm.nix
    ./keybase.nix
    ./xresources.nix
  ];

  xdg.configFile = {
    "bin/mostused" = {
      executable = true;
      text = with pkgs;
      ''
        #!/usr/bin/env bash
        IFS=$(printf '\t\n')
        apps="brave
        calibre
        gimp
        kb_switch.sh
        leave.sh
        libreoffice
        passmenu
        thunderbird
        xterm"

        $(echo "$apps" |\
        dmenu -i -fn 'Monospace-8' )
      '';
    };
    "bin/leave.sh" = {
      executable = true;
      text = with pkgs;
      ''
        #!/usr/bin/env bash
        choice_by_dmenu() {
          choice="$(echo -e "a: Logout\nr: Reboot\ns: Shutdown" |\
          dmenu -i -fn 'Monospace-8' |\
          cut -d ':' -f 1)"
        }

        choice_by_dmenu

        case "$choice" in
          a) pkill X & ;;
          r) sudo sync && sudo systemctl reboot ;;
          s) sudo sync && sudo systemctl poweroff ;;
        esac
      '';
    };
    "bin/kb_switch.sh" = {
      executable = true;
      text = with pkgs;
      ''
        #!/usr/bin/env bash
        choice_by_dmenu() {
          choice="$(echo -e "a: GB Colemak\nr: US\ns: DE" |\
          dmenu -i -fn 'Monospace-8' |\
          cut -d ':' -f 1)"
        }

        choice_by_dmenu

        case "$choice" in
          a) setxkbmap gb colemak && xset r 66 ;;
          r) setxkbmap us && xset r 66 ;;
          s) setxkbmap de && xset r 66 ;;
        esac
      '';
    };
    "bin/startdwm" = {
      executable = true;
      text = with pkgs;
      ''
        #!/usr/bin/env bash
        while true ; do
          while true ; do
            i3status |\
            while read -r ; do
              xsetroot -name "$REPLY" ;
            done
          done &
          dwm
        done
      '';
    };
    "bin/gitdate" = {
      executable = true;
      source = ./gitdate;
    };
  };

  # Configure ~/.xinitrc
  xsession = {
    enable = true;
    windowManager.command =
      ''
        if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
          eval $(dbus-launch --exit-with-session --sh-syntax)
        fi
        systemctl --user import-environment DISPLAY XAUTHORITY

        if command -v dbus-update-activation-environment >/dev/null 2>&1; then
          dbus-update-activation-environment DISPLAY XAUTHORITY
        fi

        startdwm
      '';
    scriptPath = ".xinitrc";
  };
}
