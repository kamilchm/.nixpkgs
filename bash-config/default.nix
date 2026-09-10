{ stdenv, bashInteractive, glibcLocales, fzf, broot, jdk, nodejs_24, vte }:

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
      --subst-var-by node_path ${nodejs_24}

    cp -dr --no-preserve='ownership' $src/dircolors $out/userHome/.dircolors
    substitute $src/term_profile $out/userHome/.term_profile --subst-var-by vte ${vte}

    cp -R $src/shells $out/shells
    substituteInPlace $out/userHome/.bashrc \
      --subst-var-by shells $out/shells
  '';
}
