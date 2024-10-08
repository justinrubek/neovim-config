_: {
  perSystem = {self', ...}: {
    neovimConfiguration = {
      enable = true;
      modules = [
        ./config.nix
      ];
    };

    packages.default = self'.packages.neovim;
  };
}
