{ stdenv, appimageTools, fetchurl }:
appimageTools.wrapType2 {
  name = "beakerbrowser";
  src = fetchurl {
    url = "https://github.com/beakerbrowser/beaker/releases/download/0.8.7/Beaker.Browser.0.8.7.AppImage";
    sha256 = "0x29ysnqjf7f0s6kgqkm5wmc4d3zp2gfbg0qh78qgl4phyhfzgfr";
  };
}
