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

        gitg
        meld

        firefoxWrapper
        chromium

        bluejeans

        go

        gftp

        evince

        androidsdk_4_4
      ];
    };
  };
}
