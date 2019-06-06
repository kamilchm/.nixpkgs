{stdenv}:

stdenv.mkDerivation rec {
  name = "tig-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome/.config/tig
    cp -dr --no-preserve='ownership' $src/config $out/userHome/.config/tig
  '';
}
