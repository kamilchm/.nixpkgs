with import <nixpkgs> {};

mkShell {
  buildInputs = [ nodejs-14_x python27 vips gobject-introspection pkgconfig cmake ] ++
    (with nodePackages; [ yarn pnpm flow node-gyp node-gyp-build node-pre-gyp ]);

  shellHook = ''
    export LANG="en_US.UTF-8"
    export npm_config_ignore_scripts=true
    export PATH="`pwd`/node_modules/.bin:$PATH"
  '';
}
