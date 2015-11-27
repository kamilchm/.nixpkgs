{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
    enableBluejeans = true;
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
        telnet
        wireshark-gtk

        termite
        cv
        powerline-fonts
        clipit

        pasystray
        pavucontrol

        blueman

        arandr

        tree
        fzf
        silver-searcher
        ranger
        my_vim
        gawp
        atom

        git
        git-radar
        gitg
        meld
        tig

        bazaar
        mercurial

        zip
        unzip

        bc

        firefoxWrapper
        chromium
        httpie

        hipchat

        cloc

        python27Packages.virtualenvwrapper

        go
        goPackages.glide.bin

        oraclejdk8
        maven
        idea.idea-ultimate

        nodejs

        python27Packages.docker_compose
        vagrant
        rkt

        ansible

        gftp

        pencil

        evince
        vlc
        viewnior

        spaceFM
        androidsdk_4_4
      ];
    };
  };
}
