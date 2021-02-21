{ vimUtils, fetchFromGitHub }:
{
  vim-ripgrep = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-ripgrep-2018-09-09";
    src = fetchFromGitHub {
      owner = "jremmen";
      repo = "vim-ripgrep";
      rev = "ec87af6b69387abb3c4449ce8c4040d2d00d745e";
      sha256 = "1by56rflr0bmnjvcvaa9r228zyrmxwfkzkclxvdfscm7l7n7jnmh";
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

  vim-reason-plus = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-reason-plus-2018-08-22";
    src = fetchFromGitHub {
      owner = "reasonml-editor";
      repo = "vim-reason-plus";
      rev = "e4460795d80329ec20e9ddc7b535f1cd2731acc8";
      sha256 = "07351b58afid3jwxmw9xmplpkxjy4hpbkfkw0lqapndn4a8xjnm0";
    };
    dependencies = [];
  };
}
