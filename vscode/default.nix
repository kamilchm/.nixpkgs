{ stdenv, neovim }:

stdenv.mkDerivation rec {
  name = "vscode-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    target="$out/userHome/.config/CodeNix/User";
    install -dm 755 $target
    cp -dr --no-preserve='ownership' $src/settings.json $target
    substituteInPlace $target/settings.json \
          --subst-var-by neovim_bin ${neovim}/bin/nvim
    substituteInPlace $target/settings.json \
          --subst-var-by neovim_init "${../vim-config/init.lua}"
    echo "VSCode reset command: cp $target/settings.json ~/.config/Code/User"
  '';
}
