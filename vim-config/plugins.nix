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
    name = "vim-graphql-2019-02-14";
    src = fetchFromGitHub {
      owner = "jparise";
      repo = "vim-graphql";
      rev = "792c7bcb138c1e787a7527f16ce63e8cf53df6ba";
      sha256 = "1hncf7kjn6acji67x263xraqlvdg4kszwhlzcggym81mcxmpmzl6";
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

  vim-ocaml = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-ocaml-2019-11-06";
    src = fetchFromGitHub {
      owner = "ocaml";
      repo = "vim-ocaml";
      rev = "48a76277f6c139bb043b16e51d83f272453b591f";
      sha256 = "18fnkgkhmi5zn9rr0g783qcllw4dn70xxhabcj9bbmrx3lm3pjz4";
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
    name = "vim-rooter-2018-09-28";
    src = fetchFromGitHub {
      owner = "airblade";
      repo = "vim-rooter";
      rev = "d5bb76e31c030e6b9197491ff521eca49332564b";
      sha256 = "1g1x7pkhalg354i41ch0wf2hmyjd33jsrc14lc8m732wxh65i0wa";
    };
    dependencies = [];
  };

  vim-pug = vimUtils.buildVimPluginFrom2Nix {
    name = "vim-pug-2019-02-12";
    src = fetchFromGitHub {
      owner = "digitaltoad";
      repo = "vim-pug";
      rev = "ce65804775f77efad3f97d69e44093d1466051de";
      sha256 = "0s2dryi4n21wf11czajq6g7yhh4jwdl449cq6bjj7rkjqb9rbx8r";
    };
    dependencies = [];
  };
}
