{ vimUtils, fetchFromGitHub }:
{
  diffconflicts = vimUtils.buildVimPlugin {
    name = "diffconflicts-2022-04-26";
    src = fetchFromGitHub {
      owner = "whiteinge";
      repo = "diffconflicts";
      rev = "05e8d2e935a235b8f8e6d308a46a5f028ea5bf97";
      sha256 = "sha256-H0fME8mnoTwZAS+66ko/riVWCddOKTIgd4SkmRN5JsQ=";
    };
    dependencies = [];
  };

  nvim-rg = vimUtils.buildVimPlugin {
    name = "nvim-rg-2023-08-12";
    src = fetchFromGitHub {
      owner = "duane9";
      repo = "nvim-rg";
      rev = "c24e37093929a60e61761bdfa591af6984e49b51";
      sha256 = "sha256-PBDdkhZq5OnYpWSbLRG8krMTcuaCRn0mSpRLCqnEgLk=";
    };
    dependencies = [];
  };

  starlark-vim = vimUtils.buildVimPlugin {
    name = "starlark-vim-2024-01-20";
    src = fetchFromGitHub {
      owner = "cappyzawa";
      repo = "starlark.vim";
      rev = "55b48a87066a142faa51bbc0548a46d1575d15f0";
      sha256 = "sha256-TRJ7igED1TqFdDDoIzXE4xSYWvmXkLJENbQDupl0EIE=";
    };
    dependencies = [];
  };

  hexmode = vimUtils.buildVimPlugin {
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
