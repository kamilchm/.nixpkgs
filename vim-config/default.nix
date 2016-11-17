{ pkgs }:

let
my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchFromGitHub ctags; };

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
      set hlsearch
      set history=700
      set number
      set laststatus=2

      set termguicolors
      colorscheme molokai
      let g:airline_theme = 'molokai'

      set grepprg=rg\ --vimgrep
      " bind K to grep word under cursor
      nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

      let g:ctrlp_user_command = 'rg --files %s'
      let g:ctrlp_use_caching = 0

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
        "vim-airline-themes"
        "sleuth"
        "neomake"
        "vim-gutentags"
        "vim-go"
        "vim-javascript"
        "vim-vue"
        "elm-vim"
        "vim-pony"
        "nim-vim"
        "vim-elixir"
        "alchemist-vim"
      ]; }
    ];
  };
}
