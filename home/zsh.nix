{ pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    shellAliases = (import ./aliases.nix);

    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;

    initExtraBeforeCompInit = ''
      export EDITOR="nvim"
      export CLICOLOR="1"
      export EMAIL="uh@uleenucks.de"
      eval "$(direnv hook zsh)"
      eval "$(keychain --systemd --eval --agents ssh,gpg id_ed25519 github_ed25519 DDE9D7938ED4549F9B25FF5A26030CB15C34002F)"
    '';

    initExtra = /* zsh */ ''
      autoload -U zmv
      autoload -U url-quote-magic

      zle -N self-insert url-quote-magic

      bindkey "^[[1~" beginning-of-line
      bindkey "^[[4~" end-of-line
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "fzf" "git" "history" "man" "pass" "python" ];
      theme = "half-life";
    };
  };
}
