{stdenv}:

stdenv.mkDerivation rec {
  name = "niri-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome/.config/niri
    cp -dr --no-preserve='ownership' $src/config.kdl $out/userHome/.config/niri
  '';
}
