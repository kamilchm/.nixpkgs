with import <nixpkgs> {};

mkShell {
  buildInputs = [ nodejs-12_x ] ++
    (with ocamlPackages; [ ocaml ninja merlin reason ]);

  shellHook = ''
    export npm_config_ignore_scripts=true
    export PATH="`pwd`/node_modules/.bin:$PATH"

    if [ ! -f node_modules/.bin/bsc ]; then
      echo "No bsc found in workspace, run 'setupBsc'"
    fi

    alias setupBsc='npm i -D bs-platform@6.1.0 ocaml-language-server'
  '';
}
