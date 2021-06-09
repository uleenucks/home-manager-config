{ pkgs, nixos-vsliveshare, ... }: {
  #nixpkgs.config.allowUnfree = true;
  #nixpkgs.overlays = [ overlay-unstable ];

  imports = [
    ./packages/packages.nix
    ./home/neovim.nix
    ./home/zsh.nix
    ./home/git.nix
    ./home/keybase.nix
    ./home/gui.nix
    #./config.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "uh";
  home.homeDirectory = "/home/uh";

  home.sessionPath = [
    "/home/uh/.config/bin"
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";
}
