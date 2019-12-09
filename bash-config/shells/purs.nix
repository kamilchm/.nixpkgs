with import <nixpkgs> {};

mkShell {
  buildInputs = [ purescript psc-package spago nodejs-12_x pkgconfig ] ++
    (with nodePackages; [ pulp bower yarn node-gyp node-gyp-build node-pre-gyp ]);

  shellHook = ''
    export LANG="en_US.UTF-8"
    export npm_config_ignore_scripts=true
    export PATH="`pwd`/node_modules/.bin:$PATH"
  '';
}
