#!/usr/bin/env bash
set -e

echo "Installing nix profile"
nix-env -i all

pushd $HOME > /dev/null

echo "Creating dotfiles links in user home"
find .nix-profile/userHome/ -maxdepth 1 | sed "s/.nix-profile\/userHome\///g" | \
    grep -v "^.config$" | \
    grep -v "^$" | xargs -I {} sh -c 'rm -rf {} && ln -sf .nix-profile/userHome/{} {}'

echo "Creating .config links in user .config"
find .nix-profile/userHome/.config -maxdepth 1 | sed "s/.nix-profile\/userHome\/.config\///g" | \
    grep -v "^.nix-profile/userHome/.config$" | \
    grep -v "^$" | xargs -I {} sh -c 'rm -rf .config/{} && ln -sf ../.nix-profile/userHome/.config/{} .config/{}'

popd > /dev/null

echo "Done"
