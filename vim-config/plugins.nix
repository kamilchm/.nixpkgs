{ vimUtils, fetchFromGitHub }:
{
  vim-ripgrep = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-ripgrep-2021-11-30";
    src = fetchFromGitHub {
      owner = "jremmen";
      repo = "vim-ripgrep";
      rev = "2bb2425387b449a0cd65a54ceb85e123d7a320b8";
      sha256 = "sha256-OvQPTEiXOHI0uz0+6AVTxyJ/TUMg6kd3BYTAbnCI7W8=";
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

  nim-nvim = vimUtils.buildVimPluginFrom2Nix {
    pname = "nim-nvim";
    version = "2021-05-11";
    src = fetchFromGitHub {
      owner = "alaviss";
      repo = "nim.nvim";
      rev = "ceed60855f47aa2f1d11bc737dd0e4f417c28afa";
      sha256 = "02kxlj9swzv9lidbmc9r297ilh3170rlpmvd13gmywdi7nv381k7";
    };
    meta.homepage = "https://github.com/alaviss/nim.nvim/";
  };

}
