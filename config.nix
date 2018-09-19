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
      inherit (pkgs) stdenv fzf; jdk = oraclejdk10;
    };
    my_vim = import ./vim-config { inherit pkgs ; };
    elixir-config = import ./elixir-config {
      inherit (pkgs) stdenv;
    };

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        gtk-config
        termite-config
        qtile-config
        bash-config
        elixir-config

        nix-repl
        nix-prefetch-scripts
        nixpkgs-lint
        nixops
        nox
        patchelf
        patchutils
        appimage-run

        telnet
        wireshark-gtk
        bind
        netcat-openbsd

        termite
        cv
        powerline-fonts
        clipit
        xsel
        ntfy

        pasystray
        pavucontrol
        alsaUtils

        blueman

        arandr

        gnumake

        tree
        inotify-tools
        fzf
        ripgrep
        fd
        ranger
        my_vim
        atom
        typora

        git
        git-radar
        gitg
        meld
        tig

        bazaar
        mercurial

        zip
        unzip
        p7zip

        bc

        firefoxWrapper
        chromium
        httpie
        mitmproxy

        tokei
        jq

        go

        erlangR21
        beam.packages.erlangR21.elixir

        nodejs-10_x

        oraclejdk10
        maven
        #idea.idea-ultimate
        #heroku

        python36
        gcc

        nim
        ponyc

        python36Packages.glances

        python36Packages.docker_compose
        gparted
        proot
        vagrant
        ansible2

        evince
        libreoffice
        vlc
        ffmpeg
        geeqie
        pinta
        inkscape
        graphicsmagick
        yed
        zoom-us

        deluge

        hexchat
      ];
    };
  };
}
