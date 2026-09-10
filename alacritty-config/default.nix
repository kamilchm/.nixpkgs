{stdenv}:

stdenv.mkDerivation rec {
  name = "alacritty-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome/.config/alacritty
    cp -dr --no-preserve='ownership' $src/alacritty.toml $out/userHome/.config/alacritty
  '';
}
