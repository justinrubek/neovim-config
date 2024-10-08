{
  inputs = {
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    ghlink = {
      url = "github:matthewdargan/ghlink";
      inputs = {
        fenix.follows = "fenix";
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-go = {
      url = "github:matthewdargan/nix-go";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hooks.url = "github:cachix/git-hooks.nix";
    systems.url = "github:nix-systems/default";
  };
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;
      imports = [
        ./flake-parts/pre-commit.nix
        ./flake-parts/shells.nix
        ./packages/neovim
      ];
    };
}
