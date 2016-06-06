# .nixpkgs aka dotfiles with nix

```
nix-env -i all
```

will create *dotfiles* under `~/nix.profile/userHome/`

you can link to them with:
```
find .nix-profile/userHome/ | sed "s/.nix-profile\/userHome\///g" | grep -v "^$" | xargs -I {} echo "ln -s ~/nix.profile/userHome/{} ~/{}"
```
