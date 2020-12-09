{
  allowUnfree = true;
  android_sdk.accept_license = true;

  firefox = {
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true;
  };


  packageOverrides = pkgs_: with pkgs_;
    let jdk = adoptopenjdk-hotspot-bin-15; in {

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
      inherit (pkgs) stdenv bashInteractive fzf; inherit jdk;
    };
    my_vim = import ./vim-config { inherit pkgs ; };
    elixir-config = import ./elixir-config {
      inherit (pkgs) stdenv;
    };
    tig-config = import ./tig-config {
      inherit (pkgs) stdenv;
    };

    beakerbrowser = callPackage ./beakerbrowser.nix {};

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        gtk-config
        termite-config
        qtile-config
        bash-config
        elixir-config
        tig-config

        nix-prefetch-scripts
        nixpkgs-lint
        nixops
        nox
        patchelf
        patchutils
        appimage-run

        telnet
        wireshark-qt
        bind
        netcat-openbsd

        termite
        cv
        powerline-fonts
        clipit
        xsel
        # ntfy

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
        nushell
        vscode
        typora

        aspell
        aspellDicts.en
        aspellDicts.en-computers
        aspellDicts.en-science
        aspellDicts.pl

        git
        git-radar
        gitg
        meld
        tig

        zip
        unzip
        p7zip

        bc

        firefox-bin
        chromium
        beakerbrowser
        httpie
        mitmproxy

        tokei
        jq
        cue

        go

        erlangR21
        beam.packages.erlangR21.elixir_1_8

        flow
        shellcheck

        jdk
        maven
        #idea.idea-ultimate
        #heroku

        python36
        gcc

        nim
        ponyc

        glances

        docker-compose
        gparted
        proot
        vagrant

        evince
        libreoffice
        vlc
        ffmpeg
        geeqie
        pinta
        inkscape
        graphicsmagick
        zoom-us

        deluge

        hexchat
      ];
    };
  };
}
