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
    name = "vim-graphql-2020-01-01";
    src = fetchFromGitHub {
      owner = "jparise";
      repo = "vim-graphql";
      rev = "0858a26d7b3bd263f40b1844829651ea5a577364";
      sha256 = "15mfxidql0qy6sxd3dmm894fjw552kp1xia0iikcvywrxgdrpnic";
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
