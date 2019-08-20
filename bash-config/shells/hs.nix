with import <nixpkgs> {};

let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
in

mkShell {
  buildInputs = [
    (with haskellPackages; [ ghc hlint brittany stack ])
    (all-hies.selection { selector = p: { inherit (p) ghc865; }; })
  ];
}
