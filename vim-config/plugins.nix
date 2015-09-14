{ vimUtils, fetchgit }:
{
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
