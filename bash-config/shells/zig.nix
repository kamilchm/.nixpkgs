with import <nixpkgs> {};

mkShell {
  buildInputs = [ zig zls ];
}
