with import <nixpkgs> {};

mkShell {
  buildInputs = with ocamlPackages_latest;
                  [ opam ocaml autoconf automake gnum4
                  ncurses pkgconfig gmp zlib which perl ];

  shellHook = ''
    if [ ! -d _opam ]; then
      opam switch create . ocaml-system --deps-only
    fi
    eval $(opam env)
  '';
}
