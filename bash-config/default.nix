{ stdenv, bashInteractive, glibcLocales, fzf, broot, jdk, nodejs_24 }:

stdenv.mkDerivation rec {
  name = "bash-config";

  phases = [ "installPhase" ];

  propagatedBuildInputs = [ bashInteractive ];

  src = ./.;

  installPhase = ''
    install -dm 755 $out/userHome
    substitute $src/bashrc $out/userHome/.bashrc \
      --subst-var-by fzf_src ${fzf.src}
    substituteInPlace $out/userHome/.bashrc \
      --subst-var-by glibcLocales ${glibcLocales}
    substituteInPlace $out/userHome/.bashrc \
      --subst-var-by broot ${broot}
    substituteInPlace $out/userHome/.bashrc \
      --subst-var-by jdk ${jdk}
    substituteInPlace $out/userHome/.bashrc \
      --subst-var-by npm ${nodejs_24}/bin/npm

    cp -R $src/shells $out/shells
    substituteInPlace $out/userHome/.bashrc \
      --subst-var-by shells $out/shells
  '';
}
