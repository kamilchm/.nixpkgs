with import <nixpkgs> {};

mkShell {
  buildInputs = [ nodejs-10_x python27 ] ++
    (with nodePackages_10_x; [ yarn node-gyp node-gyp-build node-pre-gyp ]);

  shellHook = ''
    export LANG="en_US.UTF-8"
    export PATH="`pwd`/node_modules/.bin:$PATH"
    if [ ! -f node_modules/.bin/typescript-language-server ]; then
      npm i -D typescript-language-server --no-save
    fi
  '';
}
