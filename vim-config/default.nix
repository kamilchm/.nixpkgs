{ pkgs }:

let
my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchFromGitHub; };

in with pkgs; neovim.override {
  vimAlias = true;
  configure = {
    customRC = ''
      syntax on
      filetype on
      set expandtab
      set tabstop=2
      set softtabstop=0
      set shiftwidth=2
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
      set signcolumn=yes

      set termguicolors
      set background=dark
      colorscheme molokai
      let g:airline_theme = 'molokai'

      set grepprg=rg\ --
      " bind K to grep word under
      nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

      let g:ctrlp_user_command = 'rg --files %s'
      let g:ctrlp_use_caching = 0

      let g:deoplete#enable_at_startup = 1

      " Error and warning signs.
      let g:ale_sign_error = '⤫'
      let g:ale_sign_warning = '⚠'

      " Enable integration with airline.
      let g:airline#extensions#ale#enabled = 1

      let g:ale_linters = {
      \   'javascript': ['standard', 'flow'],
      \}
      let g:ale_fixers = {'javascript': ['standard']}

      let g:go_highlight_build_constraints = 1
      let g:go_highlight_extra_types = 1
      let g:go_highlight_fields = 1
      let g:go_highlight_functions = 1
      let g:go_highlight_methods = 1
      let g:go_highlight_operators = 1
      let g:go_highlight_structs = 1
      let g:go_highlight_types = 1

      " let g:go_fmt_command = "goimports"

      autocmd FileType go nmap <leader>b  <Plug>(go-build)
      autocmd FileType go nmap <leader>r  <Plug>(go-run)
      autocmd FileType go nmap <leader>t  <Plug>(go-test)
      autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)

      let g:LanguageClient_serverCommands = {
          \ 'python': ['pyls'],
          \ 'reason': ['ocaml-language-server', '--stdio'],
          \ 'javascript': ['javascript-typescript-stdio'],
          \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
          \ }
      " Automatically start language servers.
      let g:LanguageClient_autoStart = 1
      let g:LanguageClient_signColumnAlwaysOn = 1
      " let g:LanguageClient_loggingLevel = 'DEBUG'

      au BufEnter *.ml setf ocaml
      au BufEnter *.mli setf ocaml
      au BufEnter *.atd setf ocaml
      au FileType ocaml set shiftwidth=2 tabstop=2

      let g:opamshare = substitute(system('${pkgs.opam}/bin/opam config var share'),'\n$',''','''''')
      execute "set rtp+=" . g:opamshare . "/merlin/vim"

      nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
      nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
      nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
      nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
      nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

      let g:flow#autoclose = 1
      let g:flow#showquickfix = 0
    '';

    vam.knownPlugins = vimPlugins // my_plugins;
    vam.pluginDictionaries = [
      { names = [
        "ale"
        "ctrlp"
        "vim-rooter"
        "vim-addon-nix"
        "fzfWrapper"
        "nvim-completion-manager"
        "deoplete-nvim"
        "LanguageClient-neovim"
        "molokai"
        "fugitive"
        "gitgutter"
        "vim-airline"
        "vim-airline-themes"
        "sleuth"
        "vim-go"
        "vim-javascript"
        "typescript-vim"
        "vim-graphql"
        "vim-vue"
        "elm-vim"
        "vim-pony"
        "nim-vim"
        "vim-elixir"
        "alchemist-vim"
        "vim-reason-plus"
        "vim-flow"
        "vim-pug"
        "hexmode"
      ]; }
    ];
  };
}
