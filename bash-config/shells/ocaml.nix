with import <nixpkgs> {};

mkShell {
  buildInputs = with ocamlPackages_latest;
                  [ opam ocaml autoconf automake gnum4
                  ncurses pkgconfig gmp zlib which ];

  shellHook = ''
    if [ ! -d _opam ]; then
      opam switch create ./ ocaml-system --deps-only
    fi
    eval $(opam env)

    alias setup-dev="opam install utop merlin ocp-indent dune"
  '';
}
