with import <nixpkgs> {};

mkShell {
  buildInputs = [ nodejs-12_x python27 vips gobject-introspection pkgconfig ] ++
    (with nodePackages; [ yarn flow node-gyp node-gyp-build node-pre-gyp ]);

  shellHook = ''
    export LANG="en_US.UTF-8"
    export npm_config_ignore_scripts=true
    export PATH="`pwd`/node_modules/.bin:$PATH"
  '';
}
