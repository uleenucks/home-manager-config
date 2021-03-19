{ config, pkgs, ... }:

let customPlugins = {
  oceanic_next = pkgs.vimUtils.buildVimPlugin {
    name = "oceanicnext";
    src = pkgs.fetchFromGitHub {
      owner = "mhartingtion";
      repo = "oceanic-next";
      rev = "master";
      sha256 = "1wazbyxaq71mlpyvyxrbrpyb9vgkcsj2y2zf1sba9gfjjszph482";
    };
  };
  airline = pkgs.vimUtils.buildVimPlugin {
    name = "airline";
    src = pkgs.fetchFromGitHub {
      owner = "vim-airline";
      repo = "vim-airline";
      rev = "master";
      sha256 = "0hi4yvd5b8il63a42kk10hxc8ixb1khf8h8q601qipkvgla8mpiy";
    };
  };
  airline_theme = pkgs.vimUtils.buildVimPlugin {
    name = "airline_theme";
    src = pkgs.fetchFromGitHub {
      owner = "vim-airline";
      repo = "vim-airline-themes";
      rev = "master";
      sha256 = "02dq887676dq2rm1fxpzf3piyabs6zj0rvc70nxa5vvlv68qp6k7";
    };
  };
  vim_nix = pkgs.vimUtils.buildVimPlugin {
    name = "vim-nix";
    src = pkgs.fetchFromGitHub {
      owner = "LnL7";
      repo = "vim-nix";
      rev = "master";
      sha256 = "1kgziwckdjg3sb1z4anwsn1c72hny60vhimxpb6424bylk1qy22j";
    };
  };
  securemodelines = pkgs.vimUtils.buildVimPlugin {
    name = "securemodelines";
    src = pkgs.fetchFromGitHub {
      owner = "ciaranm";
      repo = "securemodelines";
      rev = "master";
      sha256 = "0iv30pdy8gdzjy49xd74a6lyygg6mnrjs2x6q52cz1m84qnimibl";
    };
  };
  devicons = pkgs.vimUtils.buildVimPlugin {
    name = "vim-devicons";
    src = pkgs.fetchFromGitHub {
      owner = "ryanoasis";
      repo = "vim-devicons";
      rev = "v0.11.0";
      sha256 = "00n818s7wy39gkpfwq5l8awg2qpzi4gj5s16hyrlrlyklrpgl48g";
    };
  };
  indentline = pkgs.vimUtils.buildVimPlugin {
    name = "indentLine";
    src = pkgs.fetchFromGitHub {
      owner = "Yggdroot";
      repo = "indentLine";
      rev = "master";
      sha256 = "1ns3v4r5m6ckchmkaqkpk8dymh7hwj22d7x23hagmk4zv4hc2mhq";
    };
  };
  better_whitespace = pkgs.vimUtils.buildVimPlugin {
    name = "vim-better-whitespace";
    src = pkgs.fetchFromGitHub {
      owner = "ntpeters";
      repo = "vim-better-whitespace";
      rev = "master";
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
      set lcs=tab:│┈,extends:>,precedes:<,nbsp:&
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

