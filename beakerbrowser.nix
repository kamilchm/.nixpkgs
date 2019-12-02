{ stdenv, appimageTools, fetchurl }:
appimageTools.wrapType2 {
  name = "beakerbrowser";
  src = fetchurl {
    url = "https://github.com/beakerbrowser/beaker/releases/download/0.8.8/Beaker.Browser.0.8.8.AppImage";
    sha256 = "15fnxam41kkggiws4ci7r8k4gca27rx9ankblxicpck66b5g3451";
  };
}
