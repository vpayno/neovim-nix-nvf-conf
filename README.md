# neovim-nix-nvf-conf

My neovim configuration manged with [Nix](https://determinate.systems/nix/) and
[nvf](https://github.com/NotAShelf/nvf).

## About

Looking for a new way of managing vim configurations that I can also take with
me to other system. One of my favorite Nixims is that you can install/run
software without interfering with the dependency trees of other applications.

It's also a good way to practice writing
[Nix Flakes](https://nixos.wiki/wiki/Flakes) and
[NixOS Configurations](https://wiki.nixos.org/wiki/NixOS_Wiki).

## Manual steps

### Spell

If `~/.local/share/nvf/site/spell/programming.utf-8.spl` is missing on startup,
run

```vimscript
:DirtytalkUpdate
```

## nvf Documentation

- [Manual](https://notashelf.github.io/nvf/)
- [Config Options](https://notashelf.github.io/nvf/options.html)

## nvf Examples

To run the default nvim editor managed with `nvf` and
[Home Manager](https://github.com/nix-community/home-manager):

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

## neovim-nix-nvf-conf Usage

To run the local checkout:

```bash { name=nix-run-local excludeFromRunAll=true }
nix run .
```

To run the flake:

```bash { name=nix-run-flake excludeFromRunAll=true }
nix run github:vpayno/neovim-nix-nvf-conf  # -- nvim arguments
```

To manually install it on the default profile:

```bash { name=nix-profile-install excludeFromRunAll=true }
nix profile install github:vpayno/neovim-nix-nvf-conf
```

To run the local checkout:

```bash { name=nix-profile-update excludeFromRunAll=true }
nix profile upgrade neovim-nix-nvf-conf
```
