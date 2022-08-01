{ stdenv, bashInteractive, glibcLocales, fzf, broot, jdk }:

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

    cp -R $src/shells $out/shells
    substituteInPlace $out/userHome/.bashrc \
      --subst-var-by shells $out/shells
  '';
}
