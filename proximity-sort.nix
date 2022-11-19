{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "proximity-sort";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "jonhoo";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-w1q7ND3v6xyDCaeYqRDza+Oz1E6ztoV9NbJ7xtAbUSQ=";
  };

  cargoSha256 = "sha256-nlOAiBqsJvudNBuyuJhg2ENAtYB1AHG1VDQ1CKaqSHk=";

  meta = with lib; {
    description = "Simple command-line utility for sorting inputs by proximity to a path argument";
    homepage = "https://github.com/jonhoo/proximity-sort";
    license = licenses.unlicense;
    maintainers = [ maintainers.kamilchm ];
  };
}
