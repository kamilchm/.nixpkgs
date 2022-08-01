{stdenv, materia-theme}:

stdenv.mkDerivation rec {
  name = "gtk-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    cp $src/gtkrc-2.0 $out/userHome/.gtkrc-2.0
    install -dm 755 $out/userHome/.config/gtk-3.0
    cp -dr --no-preserve='ownership' $src/settings.ini $out/userHome/.config/gtk-3.0
    install -dm 755 $out/userHome/.local/share/themes
    cp -dr --no-preserve='ownership' ${materia-theme}/share/themes/* $out/userHome/.local/share/themes/
  '';
}
