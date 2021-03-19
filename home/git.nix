{ config, pkgs, ... }:

let
  gitConfig = {
    core = {
      editor = "nvim";
    };
    init.defaultBranch = "main";
    merge.tool = "vimdiff";
    pull.rebase = false;
  };
in
{
  programs.git = {
    enable = true;
    extraConfig = gitConfig;
    signing = {
      key = "26030CB15C34002F";
      signByDefault = true;
    };
    userEmail = "uh@uleenucks.de";
    userName = "Uwe Hermann";
  };
}
