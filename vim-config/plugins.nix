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

  vim-graphql = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-graphql-2018-06-26";
    src = fetchFromGitHub {
      owner = "jparise";
      repo = "vim-graphql";
      rev = "4a46f86f0dbd6ff3bd22db8f48a692075d64f6c2";
      sha256 = "08dxdicslxhmy6qqbwgriry8m8g22qpjbd0v2bz2c2lcig68qwfy";
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

  alchemist-vim = vimUtils.buildVimPluginFrom2Nix {
    name = "alchemist-vim-2018-09-02";
    src = fetchFromGitHub {
      owner = "slashmili";
      repo = "alchemist.vim";
      rev = "35e7e3062d1661b1c081765ed05bd8f0f5265183";
      sha256 = "08i2nzsaq73iz8wkryq5nly3hl0xb3zy16zk7k28bslvyj3ricnc";
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
    name = "vim-reason-plus-2018-02-24";
    src = fetchFromGitHub {
      owner = "reasonml-editor";
      repo = "vim-reason-plus";
      rev = "91138fa3ff985a89b0c863d1ff389b40ff6c28c9";
      sha256 = "169nmcwwskr9m1b7f0p8d0c8l2k9yhblb868w2n6vv3wjjamg7sd";
    };
    dependencies = [];
  };

  vim-flow = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-flow-2017-12-13";
    src = fetchFromGitHub {
      owner = "flowtype";
      repo = "vim-flow";
      rev = "4acd33aceb3c49c6872ee4f3f717802d4c73efbf";
      sha256 = "1dq38mlzwalkvps9zpzc3fz5bmrx9rwb39gan4x5qlg59yywry91";
    };
    dependencies = [];
  };

  vim-rooter = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-rooter-2017-11-20";
    src = fetchFromGitHub {
      owner = "airblade";
      repo = "vim-rooter";
      rev = "3509dfb80d0076270a04049548738daeedf6dfb9";
      sha256 = "03j26fw0dcvcc81fn8hx1prdwlgnd3g340pbxrzgbgxxq5kr0bwl";
    };
    dependencies = [];
  };

  vim-pug = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-pug-2017-04-07";
    src = fetchFromGitHub {
      owner = "digitaltoad";
      repo = "vim-pug";
      rev = "ddc5592f8c36bf4bd915c16b38b8c76292c2b975";
      sha256 = "069pha18g1nlzg44k742vjxm4zwjd1qjzhfllkr35qaiflvjm84y";
    };
    dependencies = [];
  };
}
