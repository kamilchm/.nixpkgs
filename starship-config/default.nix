{stdenv}:

stdenv.mkDerivation rec {
  name = "starship-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome/.config
    cp -dr --no-preserve='ownership' $src/starship.toml $out/userHome/.config/starship.toml
  '';
}
