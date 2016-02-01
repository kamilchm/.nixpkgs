{ pkgs }:

let
my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchgit fetchFromGitHub ; };

in with pkgs; vim_configurable.customize {
  name = "vim";
  vimrcConfig = {
    customRC = ''
      syntax on
      filetype on
      set expandtab
      set tabstop=4
      set softtabstop=0
      set shiftwidth=4
      set smarttab
      set autoindent
      set smartindent
      set smartcase
      set ignorecase
      set modeline
      set nocompatible
      set encoding=utf-8
      set incsearch
      set history=700
      set number
      set laststatus=2
      colorscheme molokai
      au BufRead,BufNewFile *.tag :set filetype=html
    '';

    vam.knownPlugins = vimPlugins // my_plugins;
    vam.pluginDictionaries = [
      { names = [
        "ctrlp"
        "vim-addon-nix"
        "youcompleteme"
        "molokai"
        "fugitive"
        "gitgutter"
        "vim-airline"
        "sleuth"
        "vim-go"
        "vim-javascript"
        "vim-jsx"
        "elm-vim"
        "pony-vim"
        "apiblueprint-vim"
        "nim-vim"
        "vim-elixir"
      ]; }
    ];
  };
}
