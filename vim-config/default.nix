{ pkgs }:

let
my_plugins = import ./plugins.nix { inherit (pkgs) vimUtils fetchFromGitHub; };

in with pkgs; neovim.override {
  vimAlias = true;
  configure = {
    customRC = ''
      luafile ${./init.lua}
    '';

    packages.all.start = with pkgs.vimPlugins; with my_plugins; [
      ale
      vim-rooter
      vim-nix
      fzf-lua
      nvim-rg
      editorconfig-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      lsp_signature-nvim
      telescope-nvim
      actions-preview-nvim
      cmp_luasnip
      luasnip
      cmp-buffer
      cmp-path
      cmp-cmdline
      delimitMate
      tcomment_vim
      molokai
      fugitive
      gitgutter
      diffconflicts
      vim-indent-guides
      git-messenger-vim
      vim-airline
      vim-airline-themes
      sleuth
      vim-fetch
      rust-vim
      zig-vim
      vim-go
      vim-javascript
      vim-jsx-pretty
      markdown-preview-nvim
      yats-vim
      vim-graphql
      vim-vue
      elm-vim
      vim-pony
      nim-vim
      vim-elixir
      alchemist-vim
      vim-ocaml
      vim-terraform
      starlark-vim
      purescript-vim
      haskell-vim
      dhall-vim
      vim-toml
      vim-pug
      vim-astro
      hexmode
    ];
  };
}
