{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Browsers
    firefox
    brave

    # Misc. Unix-ish tools
    direnv
    gnupg
    htop
    wget
    curl
    p7zip
    binutils
    file
    killall
    xorg.xkill
    git
    pv
    fzf
    unzip

    # Linters and formatters
    shellcheck
    nixfmt

    # Network diagnostics
    nmap
    inetutils

    # GPG
    gnupg
    keybase
    kbfs
    keychain
    pass
    pinentry

    # Office
    libreoffice-fresh
  ];
}
