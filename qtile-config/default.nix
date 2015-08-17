{stdenv}:

stdenv.mkDerivation rec {
  name = "termite-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome/.config/qtile
    cp -dr --no-preserve='ownership' $src/config.py $out/userHome/.config/qtile
  '';
}
