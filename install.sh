#!/usr/bin/env bash
set -e

echo "Installing nix profile"
nix-env -i all

pushd $HOME/.nix-profile/userHome > /dev/null

echo "Creating dotfiles links"
find . -follow -type f -printf "rm -rf '$HOME/%p' && mkdir -p '$HOME/%h' && ln -s '$HOME/.nix-profile/userHome/%p' '$HOME/%p'\n" | xargs -I {} sh -c {}

popd > /dev/null

echo "Installing nix shells"
rm -rf /nix/var/nix/gcroots/per-user/kamil/nxs-*
find $(dirname "$0")/bash-config/shells/ -type f -regex ".*\.nix$" -printf "nix-instantiate --add-root /nix/var/nix/gcroots/per-user/kamil/nxs-%f %p -A buildInputs | sed -e 's/!dev$//g' | xargs nix-build || exit 255\n" | xargs -I {} sh -c {}

echo "Done"
