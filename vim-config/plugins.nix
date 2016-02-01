{ vimUtils, fetchgit, fetchFromGitHub }:
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

  apiblueprint-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "apiblueprint.vim-2015-10-14";
    src = fetchFromGitHub {
      owner = "kylef";
      repo = "apiblueprint.vim";
      rev = "ea46ce2e08b1c38d62e51e1f3d0235c387976172";
      sha256 = "1rv67lxwcsbk289hfizsmp0znbcaaj0vl969yvwaywmkk6zzch7c";
    };
    dependencies = [];
  };

  nim-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "nim.vim-2015-05-10";
    src = fetchFromGitHub {
      owner = "zah";
      repo = "nim.vim";
      rev = "597cca20eb31dc55cd285f108b37ff5ca6256a69";
      sha256 = "0gykf8crmv5y1dqf43q04lsf5fs2xfp1fjcy17933j0w8agyazpx";
    };
    dependencies = [];
  };

  vim-elixir = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-elixir-2016-01-21";
    src = fetchFromGitHub {
      owner = "elixir-lang";
      repo = "vim-elixir";
      rev = "62711e50cdc655031ee05aa2ab3720a82a1aa14d";
      sha256 = "1fxk02gbf6ycxmn9fydi4jv1jraysbq9qzx6dzwlywfsn816abi8";
    };
    dependencies = [];
  };
}
