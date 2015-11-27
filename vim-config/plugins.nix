{ vimUtils, fetchgit }:
{
  elm-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "elm.vim-2015-04-21";
    src = fetchgit {
      url = "git://github.com/lambdatoast/elm.vim";
      rev = "916842745a73c73d25437ca17b88f32d8c944e1d";
      sha256 = "1wkz5r8h6f4i0rhar787p4dvs6j02zxl9ki24pczgwql6j1dgkhp";
    };
    dependencies = [];
  };

  pony-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "pony.vim-2015-10-27";
    src = fetchgit {
      url = "git://github.com/dleonard0/pony-vim-syntax";
      rev = "2323b4b21a30a81b1dbe2a154d5636fbd4edb0db";
      sha256 = "0323nl420nq9712mgqvfk6bc84bgn5x388v4s8ncqdnf1d5jjxz8";
    };
    dependencies = [];
  };

  vim-javascript = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-javascript-2015-06-18";
    src = fetchgit {
      url = "git://github.com/pangloss/vim-javascript";
      rev = "bab4f3944fb6ef0953991ddfb6c734219c95b83a";
      sha256 = "13kbz62ywrjqchzmzdfgyj7jqv7gp6sbfrwcw63b9cahhc9d7wzc";
    };
    dependencies = [];
  };

  vim-jsx = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-jsx-2015-08-01";
    src = fetchgit {
      url = "git://github.com/mxw/vim-jsx";
      rev = "82773e7be94c558c2de6bc1e84054c3915a70cb3";
      sha256 = "05801x2gyv53vc8w96966l2jy47616r4xw1ac0y41wzi1bqrh0rk";
    };
    dependencies = [];
  };

  vim-scala = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-scala-2015-03-09";
    src = fetchgit {
      url = "git://github.com/derekwyatt/vim-scala";
      rev = "71ada50fc5e2b3c9fdbdb75835a218d2c245efec";
      sha256 = "1f3l8fs2crfmjfj1wiyda9c48993b90b8l8m5vwj1hh397fzhrk1";
    };
    dependencies = [];
  };
}
