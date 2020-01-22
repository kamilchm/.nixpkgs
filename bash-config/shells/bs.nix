with import <nixpkgs> {};

mkShell {
  buildInputs = [ nodejs-12_x ] ++
    (with ocamlPackages; [ bs-platform merlin yarn ]);

  shellHook = ''
    export npm_config_ignore_scripts=true
    export PATH="`pwd`/node_modules/.bin:$PATH"
  '';
}
