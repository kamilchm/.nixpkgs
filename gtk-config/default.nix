{stdenv, albatross}:

stdenv.mkDerivation rec {
  name = "gtk-config";

  buildInputs = [ albatross ];

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    substitute $src/gtkrc-2.0 $out/userHome/.gtkrc-2.0 --subst-var-by albatross ${albatross}/share/themes/Albatross
    install -dm 755 $out/userHome/.config/gtk-3.0
    cp -dr --no-preserve='ownership' $src/settings.ini $out/userHome/.config/gtk-3.0
  '';
}
