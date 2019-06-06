with import <nixpkgs> {};

mkShell {
  buildInputs = [ purescript psc-package nodejs-12_x pkgconfig ] ++
    (with nodePackages; [ pulp bower node-gyp node-gyp-build node-pre-gyp ]);

  shellHook = ''
    export LANG="en_US.UTF-8"
    export PATH="`pwd`/node_modules/.bin:$PATH"
  '';
}
