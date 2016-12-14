# .nixpkgs aka dotfiles with nix

## Fully declarative user environment

1. Use [nix](https://nixos.org/nix/) to manage all your user space programs [declaratively](https://github.com/kamilchm/.nixpkgs/blob/5c360c3a05872f5ea15d771d289c812a3dd159b5/config.nix#L35).
2. Prepare **dotfiles** with [injected](https://github.com/kamilchm/.nixpkgs/blob/5c360c3a05872f5ea15d771d289c812a3dd159b5/gtk-config/default.nix#L14)
dependencies from https://github.com/NixOS/nixpkgs and [install it](https://github.com/kamilchm/.nixpkgs/blob/b5a0ccc07998485196ed30471e4e81781041dd74/termite-config/default.nix#L12)
into **$out/userHome**.
3. Link **dotfiles** from *.nix-profile* into user home directory.

## How to use it?

1. Install [nix](https://nixos.org/nix/)
2. Git clone **.nixpkgs** into **~/.nixpkgs**
3. Customize it for your needs.
4. Run `.nixpkgs/install.sh`
