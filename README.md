# neovim-nix-nvf-conf

My neovim configuration manged with [Nix](https://determinate.systems/nix/) and
[nvf](https://github.com/NotAShelf/nvf).

## nvf Documentation

- [Manual](https://notashelf.github.io/nvf/)
- [Config Options](https://notashelf.github.io/nvf/options.html)

## nvf Examples

To run the default nvim editor managed with `nvf` and [Home Manager](https://github.com/nix-community/home-manager):

```bash { name=run-nvf-nvim-default excludeFromRunAll=true }
nix run github:notashelf/nvf
```

To run the full nvim configuration:

```bash { name=run-nvf-nvim-maximal excludeFromRunAll=true }
nix run github:notashelf/nvf#maximal
```

`nix profile install` can be used to install it; However, you should instead use
the
[module system](https://notashelf.github.io/nvf/index.xhtml#ch-module-installation)
to install it.

```bash { name=install-nvf-nvim-maximal excludeFromRunAll=true }
nix profile install github:notashelf/nvf#maximal
```

To update it:

```bash { name=update-nvf-nvim-maximal excludeFromRunAll=true }
nix profile upgrade nvf
```
