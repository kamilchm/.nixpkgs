{stdenv}:

stdenv.mkDerivation rec {
  name = "elixir-config";

  phases = [ "installPhase" ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    cp $src/.iex.exs $out/userHome/
  '';
}
