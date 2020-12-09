{ stdenv, appimageTools, fetchurl }:
appimageTools.wrapType2 {
  name = "beakerbrowser";
  src = fetchurl {
    url = "https://github.com/beakerbrowser/beaker/releases/download/1.1.0/Beaker.Browser-1.1.0.AppImage";
    sha256 = "07hcyr6vyim8vrvw120v5jjfvy5jkcaqc3wgqgyf6prbqdx71dkp";
  };
}
