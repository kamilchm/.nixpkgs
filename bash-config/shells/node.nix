with import <nixpkgs> {};

mkShell {
  buildInputs = [ nodejs_26 python3 vips gobject-introspection pkg-config cmake ungoogled-chromium yarn pnpm node-gyp node-gyp-build node-pre-gyp ];

  LANG="en_US.UTF-8";
  npm_config_ignore_scripts="true";
  PUPPETEER_EXECUTABLE_PATH="${ungoogled-chromium}/bin/chromium";
}
