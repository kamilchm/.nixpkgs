#!/usr/bin/env bash
set -e

echo "Installing nix profile"
nix-env -i all

pushd $HOME > /dev/null

echo "Creating dotfiles links in user home"
find .nix-profile/userHome/ -maxdepth 1 | sed "s/.nix-profile\/userHome\///g" | \
    grep -v "^$" | xargs -I {} ln -sf .nix-profile/userHome/{} {}

popd > /dev/null

echo "Done"
