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
      ctrlp
      fruzzy
      vim-rooter
      vim-nix
      fzfWrapper
      vim-ripgrep
      editorconfig-vim
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      luasnip
      delimitMate
      tcomment_vim
      molokai
      fugitive
      gitgutter
      git-messenger-vim
      vim-airline
      vim-airline-themes
      sleuth
      rust-vim
      zig-vim
      vim-go
      vim-javascript
      vim-jsx-pretty
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
      purescript-vim
      haskell-vim
      dhall-vim
      vim-toml
      vim-pug
      hexmode
    ];
  };
}
