{stdenv}:

stdenv.mkDerivation rec {
  name = "gtk-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHomeCopy
    cp $src/gtkrc-2.0 $out/userHomeCopy/.gtkrc-2.0
    install -dm 755 $out/userHomeCopy/.config/gtk-3.0
    cp -dr --no-preserve='ownership' $src/settings.ini $out/userHomeCopy/.config/gtk-3.0
  '';
}
