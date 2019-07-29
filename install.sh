#!/usr/bin/env bash
set -e

echo "Installing nix profile"
nix-env -i all

pushd $HOME/.nix-profile/userHome > /dev/null

echo "Creating dotfiles links"
find . -follow -type f -printf "rm -rf '$HOME/%p' && mkdir -p '$HOME/%h' && ln -s '$HOME/.nix-profile/userHome/%p' '$HOME/%p'\n" | xargs -I {} sh -c {}

popd > /dev/null

echo "Done"
