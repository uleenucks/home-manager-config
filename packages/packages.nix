{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Browsers
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
    termite
    alacritty
    gnumake
    gptfdisk

    # Linters and formatters
    shellcheck
    nixfmt
    nix-prefetch-github

    # Network diagnostics
    nmap
    inetutils

    # GPG
    gnupg
    keybase
    kbfs
    keychain
    pass
    genpass
    pinentry

    # Office
    libreoffice-fresh
    thunderbird

    # eBook library
    calibre

    # Image Processing
    scrot
    nomacs
    gv
    graphviz-nox
    sxiv
    exif
    exiftool

    # Video Player
    vlc

    # LaTeX
    texlive.combined.scheme-full
    pythonPackages.pygments
    opensans-ttf

    # i3 stuff
    i3status
  ];
}
