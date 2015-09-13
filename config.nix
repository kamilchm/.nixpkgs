{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true;
    enablePepperPDF = true;
  };

  packageOverrides = pkgs_: with pkgs_; {
    gtk-config = import ./gtk-config {
      inherit (pkgs) stdenv albatross;
    };
    termite-config = import ./termite-config {
      inherit (pkgs) stdenv;
      vte = gnome3.vte;
    };
    qtile-config = import ./qtile-config {
      inherit (pkgs) stdenv;
    };
    bash-config = import ./bash-config {
      inherit (pkgs) stdenv fzf;
      virtualenvwrapper = python27Packages.virtualenvwrapper;
    };
    my_vim = import ./vim-config { inherit pkgs; };

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        gtk-config
        termite-config
        qtile-config
        bash-config

        nix-repl
        nix-prefetch-scripts

        termite
        cv
        powerline-fonts
        clipit

        pasystray
        pavucontrol

        arandr

        tree
        fzf
        silver-searcher
        ranger
        my_vim
        gawp
        atom

        git-radar
        gitg
        meld

        mercurial

        zip
        unzip

        firefoxWrapper
        chromium

        bluejeans
        hipchat

        cloc

        python27Packages.virtualenvwrapper

        go
        goPackages.glide

        oraclejdk8
        maven

        python27Packages.docker_compose
        vagrant
        rkt

        ansible

        gftp

        evince

        androidsdk_4_4
      ];
    };
  };
}
