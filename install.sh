#!/usr/bin/env bash
set -e

echo "Installing nix profile"
nix-env -i all

pushd $HOME/.nix-profile/userHome > /dev/null

echo "Creating dotfiles links"
find . -follow -type f -printf "rm -rf '$HOME/%p' && mkdir -p '$HOME/%h' && ln -s '$HOME/.nix-profile/userHome/%p' '$HOME/%p'\n" | xargs -I {} sh -c {}

popd > /dev/null

if [ -d "$HOME/.nix-profile/userHomeCopy" ]; then
  pushd "$HOME/.nix-profile/userHomeCopy" > /dev/null

  echo "Copying writable dotfiles"
  find . -type f -printf "rm -rf '$HOME/%p' && mkdir -p '$HOME/%h' && cp -f '$HOME/.nix-profile/userHomeCopy/%p' '$HOME/%p'\n" | xargs -I {} sh -c {}

  popd > /dev/null
fi

echo "Applying GTK theme settings"
if [ -x "$HOME/.nixpkgs/gtk-config/apply.sh" ]; then
  "$HOME/.nixpkgs/gtk-config/apply.sh"
fi

echo "Installing nix shells"
GCROOTS="$HOME/.local/share/nix/gcroots"
mkdir -p "$GCROOTS"
rm -rf "$GCROOTS/nxs-*"
find $(dirname "$0")/bash-config/shells/ -maxdepth 1 -type f -regex ".*\.nix$" -printf "nix-instantiate --add-root $GCROOTS/nxs-%f %p -A buildInputs -A nativeBuildInputs | sed -e 's/!dev$//g' | xargs nix-build || exit 255\n" | xargs -I {} sh -c {}

#./vscode/install_extensions.sh

echo "Done"
