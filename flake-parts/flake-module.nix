{nixvim, ...}: {
  lib,
  flake-parts-lib,
  ...
}: {
  options = {
    perSystem = flake-parts-lib.mkPerSystemOption ({
        config,
        inputs',
        pkgs,
        system,
        ...
      } @ perSystemArgs: let
        cfg = config.neovimConfiguration;
      in {
        options = {
          neovimConfiguration = {
            enable = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = ''
                whether to enable neovim package generation
              '';
            };

            modules = lib.mkOption {
              type = lib.types.listOf lib.types.unspecified;
              default = [];
              description = ''
                a list of modules to use as configuration
              '';
            };
          };
        };

        config = lib.mkIf cfg.enable {
          packages.neovim = nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
            module = {
              imports =
                cfg.modules
                ++ [
                  {
                    _module.args = {
                      inherit (perSystemArgs) inputs' inputs;
                    };
                  }
                ];
            };
          };
        };
      });
  };
}
