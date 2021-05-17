{ config, pkgs, ... }:

let
  gitConfig = {
    core = {
      editor = "nvim";
      excludesfile = "~/.config/git/ignore";
      hooksPath = "~/.config/git/hooks/";
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

  home.file = {
    ".config/git/ignore".source = ./gitignore;
    ".config/git/hooks/applypatch-msg".source = ./hooks/applypatch-msg;
    ".config/git/hooks/applypatch-msg".executable = true;
    ".config/git/hooks/pre-commit".source = ./hooks/pre-commit;
    ".config/git/hooks/pre-commit".executable = true;
    ".config/git/hooks/prepare-commit-msg".source = ./hooks/prepare-commit-msg;
    ".config/git/hooks/prepare-commit-msg".executable = true;
    ".config/git/hooks/pre-rebase".source = ./hooks/pre-rebase;
    ".config/git/hooks/pre-rebase".executable = true;
  };
}
