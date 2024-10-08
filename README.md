# neovim-config

This is my personal neovim setup.
It is contained as a nix flake with a `neovim` package output.
A [flake-parts](https://github.com/hercules-ci/flake-parts) module is used to expose the final package and the module can be consumed by other flakes to do the same with different configuration.

## usage

### package

- quick run: `nix run github:justinrubek/neovim-config`
- quick install: `nix profile install github:justinrubek/neovim-config`

### flake-module

See usage in the [neovim package declaration](./packages/neovim/default.nix).
