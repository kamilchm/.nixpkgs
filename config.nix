{
  allowUnfree = true;
  android_sdk.accept_license = true;

  permittedInsecurePackages = [
    "python-2.7.18.12"
    "docker-28.5.2"
  ];

  security.chromiumSuidSandbox.enable = true;

  packageOverrides = pkgs_: with pkgs_; rec {

    niri-config = import ./niri-config {
      inherit (pkgs) stdenv;
    };
    dank-config = import ./dank-config {
      inherit (pkgs) stdenv;
    };
    gtk-config = import ./gtk-config {
      inherit (pkgs) stdenv;
    };
    # qtile-config = import ./qtile-config {
    #   inherit (pkgs) stdenv xfce blueman;
    # };
    bash-config = import ./bash-config {
      inherit (pkgs) stdenv bashInteractive glibcLocales fzf broot nodejs_24; inherit jdk;
    };
    my_vim = import ./vim-config { inherit pkgs ; };
    elixir-config = import ./elixir-config {
      inherit (pkgs) stdenv;
    };
    tig-config = import ./tig-config {
      inherit (pkgs) stdenv;
    };
    #vscode-config = import ./vscode {
    #  inherit (pkgs) stdenv; neovim = my_vim;
    #};

    all = with pkgs; buildEnv {
      name = "all";

      paths = [
        niri-config
        dank-config
        gtk-config
        adw-gtk3
        #qtile-config
        bash-config
        elixir-config
        tig-config
        #vscode-config

        # nix-prefetch-scripts
        nixpkgs-lint
        nox
        patchelf
        patchutils
        nurl

        # utillinux
        usbutils
        nettools
        wireshark-qt
        bind
        libressl.nc
        socat
        websocat
        wavemon
        whois

        #qtile
        #hyprland
        gnome-screenshot
        tilix
        nix-bash-completions
        progress
        powerline-fonts
        #clipit
        xsel
        xclip
        # ntfy

        pasystray
        pavucontrol
        brightnessctl


        arandr

        gnumake
        #bob
        toast

        tree
        inotify-tools
        fzf
        broot
        ripgrep
        fd
        navi
        proximity-sort
        #comby
        ranger
        gdu
        my_vim
        #devenv installed from tarball
        direnv
        #vscode
        static-web-server

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
        difftastic

        zip
        unzip

        bc

        gnupg

        firefox-bin
        ungoogled-chromium
        # alsaPlugins # https://github.com/NixOS/nixpkgs/issues/6860
        # microsoft-edge
        #google-chrome
        xh
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
        below

        docker-compose
        gparted
        proot

        evince
        libreoffice
        vlc
        spot
        ffmpeg
        #gthumb
        pinta
        #inkscape
        graphicsmagick
        #vokoscreen-ng
      ];
    };
  };
}
