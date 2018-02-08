{ vimUtils, fetchFromGitHub }:
{
  elm-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "elm.vim-2017-07-09";
    src = fetchFromGitHub {
      owner = "ElmCast";
      repo = "elm-vim";
      rev = "ae5315396cd0f3958750f10a5f3ad9d34d33f40d";
      sha256 = "0a85l0mcxgha4s5c9lzdv9y2c1ff942y9a5sfjihz6sph21c77xp";
    };
    dependencies = [];
  };

  vim-pony = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-pony-2017-09-30";
    src = fetchFromGitHub {
      owner = "jakwings";
      repo = "vim-pony";
      rev = "e90be86915d88f502b28b012eeae178d93784644";
      sha256 = "0dk5g9yyn87jj23ajv6w3jx7gbx9vg3a22fkjj6lkiyhhlyxbrg4";
    };
    dependencies = [];
  };

  vim-javascript = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-javascript-2018-02-05";
    src = fetchFromGitHub {
      owner = "pangloss";
      repo = "vim-javascript";
      rev = "f71693e2784594a378930e261955a85ea37dd03d";
      sha256 = "1qyaf5cwq7icdxhvn3xvzklqaiwdbkmgvwfx6ww9gfygal481v2s";
    };
    dependencies = [];
  };

  vim-vue = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-vue-2017-12-12";
    src = fetchFromGitHub {
      owner = "posva";
      repo = "vim-vue";
      rev = "6518e738863f0acd190c7564a109be021cae1b56";
      sha256 = "1rdm94632amrcynwbx7iny8wssk9b9rk8izrb7q1y7vf3ma5jkrs";
    };
    dependencies = [];
  };

  nim-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "nim.vim-2018-02-06";
    src = fetchFromGitHub {
      owner = "zah";
      repo = "nim.vim";
      rev = "f1d99dd8bdaa0b5010a83ebd826e9e2315ed36d7";
      sha256 = "1gymcblyihr6szn2bdpb3i90zbgv8nl7gifx7l6qyda460mwpxb9";
    };
    dependencies = [];
  };

  alchemist-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "alchemist-vim-2018-02-03";
    src = fetchFromGitHub {
      owner = "slashmili";
      repo = "alchemist.vim";
      rev = "1bc6ac4405f0b7bbf5dd963313f103f1416f27cb";
      sha256 = "0ff83xknlkb2rdhvpp75nclilb4mlmkr86lp9jwb52dc0a6l2g8i";
    };
    dependencies = [];
  };

  hexmode = vimUtils.buildVimPluginFrom2Nix {
    name = "hexmode-2016-11-04";
    src = fetchFromGitHub {
      owner = "fidian";
      repo = "hexmode";
      rev = "27932330b9a36c91a6039267bc32a18060e82d57";
      sha256 = "00xdv6d3rmalv342ajqd7cgbci97frd7pmsrgfnaqcfimycka3la";
    };
    dependencies = [];
  };
}
