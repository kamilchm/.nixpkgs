{stdenv}:

stdenv.mkDerivation rec {
  name = "dank-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHomeCopy/.config/DankMaterialShell
    cp -dr --no-preserve='ownership' $src/settings.json $out/userHomeCopy/.config/DankMaterialShell
    cp -dr --no-preserve='ownership' $src/plugin_settings.json $out/userHomeCopy/.config/DankMaterialShell
  '';
}
