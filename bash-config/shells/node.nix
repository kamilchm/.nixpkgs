with import <nixpkgs> {};

mkShell {
  buildInputs = [ nodejs_24 python27 vips gobject-introspection pkg-config cmake ungoogled-chromium ] ++
    (with nodePackages; [ yarn pnpm node-gyp node-gyp-build node-pre-gyp ]);

  LANG="en_US.UTF-8";
  npm_config_ignore_scripts="true";
  PUPPETEER_EXECUTABLE_PATH="${ungoogled-chromium}/bin/chromium";
}
