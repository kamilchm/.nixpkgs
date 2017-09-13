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
    };
    my_vim = import ./vim-config { inherit pkgs ; };

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        gtk-config
        termite-config
        qtile-config
        bash-config

        nix-repl
        nix-prefetch-scripts
        nixpkgs-lint
        nixops
        nox
        patchelf
        patchutils

        telnet
        wireshark-gtk
        bind
        netcat-openbsd

        termite
        cv
        powerline-fonts
        clipit
        ntfy

        pasystray
        pavucontrol

        blueman

        arandr

        gnumake

        tree
        inotify-tools
        fzf
        ripgrep
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

        cloc
        jq
        jid

        go

        elixir

        nodejs-7_x

        oraclejdk8
        maven
        #idea.idea-ultimate
        heroku

        python27
        gcc

        nim
        ponyc

        python27Packages.glances

        python27Packages.docker_compose
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
        graphicsmagick
        yed
        zoom-us

        deluge

        hexchat
      ];
    };
  };
}
