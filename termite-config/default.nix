{stdenv, vte}:

stdenv.mkDerivation rec {
  name = "termite-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    cp -dr --no-preserve='ownership' $src/dircolors $out/userHome/.dircolors
    substitute $src/term_profile $out/userHome/.term_profile --subst-var-by vte ${vte}
    install -dm 755 $out/userHome/.config/termite
    cp -dr --no-preserve='ownership' $src/config $out/userHome/.config/termite
  '';
}
