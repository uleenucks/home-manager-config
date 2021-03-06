{ config, pkgs, ... }:

let customPlugins = {
  oceanic_next = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "oceanicnext";
    src = pkgs.fetchFromGitHub {
      owner = "mhartington";
      repo = "oceanic-next";
      rev = "5ef31a34204f84714885ae9036f66a626036c3dc";
      sha256 = "1wazbyxaq71mlpyvyxrbrpyb9vgkcsj2y2zf1sba9gfjjszph482";
    };
  };
  airline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "airline";
    src = pkgs.fetchFromGitHub {
      owner = "vim-airline";
      repo = "vim-airline";
      rev = "b861f9d2483a8b066f7b5b4dbae8990ff21455c5";
      sha256 = "0rz7p95ks4ymdwz7aqahc782msdz70qx25807cwvqh1gc9x887vq";
    };
  };
  airline_theme = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "airline_theme";
    src = pkgs.fetchFromGitHub {
      owner = "vim-airline";
      repo = "vim-airline-themes";
      rev = "97cf3e6e638f936187d5f6e9b5eb1bdf0a4df256";
      sha256 = "0cbxjb1q7xlxykzq4ab4n3ny768ysf97f7h7d9spfmw286j3c2wi";
    };
  };
  vim_nix = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-nix";
    src = pkgs.fetchFromGitHub {
      owner = "LnL7";
      repo = "vim-nix";
      rev = "63b47b39c8d481ebca3092822ca8972e08df769b";
      sha256 = "08n9cgphv2m96kk5w996lwlqak011x5xm410hajmc91vy5fws361";
    };
  };
  securemodelines = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "securemodelines";
    src = pkgs.fetchFromGitHub {
      owner = "ciaranm";
      repo = "securemodelines";
      rev = "9751f29699186a47743ff6c06e689f483058d77a";
      sha256 = "0iv30pdy8gdzjy49xd74a6lyygg6mnrjs2x6q52cz1m84qnimibl";
    };
  };
  devicons = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-devicons";
    src = pkgs.fetchFromGitHub {
      owner = "ryanoasis";
      repo = "vim-devicons";
      rev = "aa13718e367c44d27a784291a546923eb562fd2a";
      sha256 = "0vvdjqickp1c13ixkams6yayqasrz05r6bqqfb4qbwpqmispvwkl";
    };
  };
  indentline = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "indentLine";
    src = pkgs.fetchFromGitHub {
      owner = "Yggdroot";
      repo = "indentLine";
      rev = "5617a1cf7d315e6e6f84d825c85e3b669d220bfa";
      sha256 = "1ns3v4r5m6ckchmkaqkpk8dymh7hwj22d7x23hagmk4zv4hc2mhq";
    };
  };
  better_whitespace = pkgs.vimUtils.buildVimPluginFrom2Nix {
    name = "vim-better-whitespace";
    src = pkgs.fetchFromGitHub {
      owner = "ntpeters";
      repo = "vim-better-whitespace";
      rev = "8cf4b2175dd61416c2fe7d3234324a6c59d678de";
      sha256 = "1iga1xdzygnr9rhv0kw01nr3vahl2d486p06slmri2vy8ngzym0q";
    };
  };
};
allPlugins = pkgs.vimPlugins // customPlugins;
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    extraConfig = ''
      set nocompatible
      set shiftwidth=2
      set tabstop=2
      set softtabstop=2
      set expandtab
      set textwidth=160
      set wrap
      set number
      set incsearch
      set ignorecase
      set hlsearch
      set showmatch
      set showmode
      set ruler
      set title
      set nosmartindent
      set cmdheight=1
      set nolinebreak
      set nostartofline
      set scrolloff=10
      set cursorline
      set colorcolumn=160
      set gdefault
      set laststatus=2
      set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
      au FocusLost * :wa
      set pastetoggle=<F2>
      set scrolloff=3
      set modelines=0
      set encoding=utf-8
      set termencoding=utf-8
      set background=dark
      set termguicolors
      syntax enable
      colorscheme OceanicNext
      let g:oceanic_next_terminal_italic = 1
      let g:oceanic_next_terminal_bold = 1
      let g:airline#extensions#tabline#enabled = 2
      let g:airline#extensions#tabline#fnamemod = ':t'
      let g:airline#extensions#tabline#left_sep = ' '
      let g:airline#extensions#tabline#left_alt_sep = '|'
      let g:airline#extensions#tabline#right_sep = ' '
      let g:airline#extensions#tabline#right_alt_sep = '|'
      let g:airline_skip_empty_sections = 1
      let g:airline_left_sep = ' '
      let g:airline_left_alt_sep = '|'
      let g:airline_right_sep = ' '
      let g:airline_right_alt_sep = '|'
      let g:airline_theme='oceanicnext'
      let g:airline_powerline_fonts = 1
      let g:secure_modelines_verbose = 0
      let g:secure_modelines_modelines = 15
      set lcs=tab:??????,extends:>,precedes:<,nbsp:&
      function! CurDir()
        let curdir = substitute(getcwd(), '/home/uh', "~", "g")
        return curdir
      endfunction
    '';
    plugins = with allPlugins; [
      oceanic_next
      airline
      airline_theme
      vim_nix
      coc-python
      securemodelines
      devicons
      indentline
      better_whitespace
    ];
  };
  home.packages = with pkgs; [ black zathura xdotool ];
}

