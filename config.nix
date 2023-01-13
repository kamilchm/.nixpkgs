{
  allowUnfree = true;
  android_sdk.accept_license = true;

  packageOverrides = pkgs_: with pkgs_; {

    gtk-config = import ./gtk-config {
      inherit (pkgs) stdenv materia-theme;
    };
    termite-config = import ./termite-config {
      inherit (pkgs) stdenv;
      vte = vte;
    };
    qtile-config = import ./qtile-config {
      inherit (pkgs) stdenv;
    };
    bash-config = import ./bash-config {
      inherit (pkgs) stdenv bashInteractive glibcLocales fzf broot; inherit jdk;
    };
    my_vim = import ./vim-config { inherit pkgs ; };
    elixir-config = import ./elixir-config {
      inherit (pkgs) stdenv;
    };
    tig-config = import ./tig-config {
      inherit (pkgs) stdenv;
    };

    proximity-sort = import ./proximity-sort.nix { inherit (pkgs) lib fetchFromGitHub rustPlatform; };

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        gtk-config
        termite-config
        qtile-config
        bash-config
        elixir-config
        tig-config

        # nix-prefetch-scripts
        nixpkgs-lint
        nox
        patchelf
        patchutils

        # utillinux
        usbutils
        nettools
        wireshark-qt
        bind
        libressl.nc
        socat
        websocat
        wavemon

        qtile
        gnome.gnome-screenshot
        termite
        tilix
        nix-bash-completions
        progress
        powerline-fonts
        clipit
        xsel
        xclip
        # ntfy

        pasystray
        pavucontrol
        brightnessctl


        arandr

        gnumake
        bob
        toast

        tree
        inotify-tools
        fzf
        broot
        ripgrep
        fd
        navi
        proximity-sort
        comby
        ranger
        gdu
        my_vim
        vscode

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

        bc

        gnupg

        firefox-bin
        ungoogled-chromium
        google-chrome
        httpie
        mitmproxy

        tokei
        sqlite
        sqlite-utils
        usql
        jq
        fx
        yq
        sampler
        cue
        jsonnet

        go


        shellcheck

        scrcpy
        #heroku

        gcc

        nim
        nimlsp

        htop

        docker-compose
        gparted
        proot

        evince
        libreoffice
        vlc
        ffmpeg
        gthumb
        pinta
        inkscape
        graphicsmagick
        vokoscreen-ng
        gromit-mpx

      ];
    };
  };
}
