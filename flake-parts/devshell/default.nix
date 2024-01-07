{
  config,
  inputs,
  lib,
  self,
  ...
}: {
  perSystem = {
    config,
    pkgs,
    system,
    inputs',
    self',
    ...
  }: {
    devShells = {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          alejandra
          inputs.home-manager.packages.${system}.home-manager
          hcloud
          packer
          inputs'.deploy-rs.packages.deploy-rs

          pkgs.age
          pkgs.ssh-to-age
          pkgs.sops

          self'.packages.push-configuration
          inputs'.thoenix.packages.cli
          self'.packages.terraform

          self'.packages.vault-bin

          self'.packages.nomad

          pkgs.skopeo
          self'.packages."scripts/skopeo-push"

          inputs'.lockpad.packages.cli
        ];

        shellHook = ''
          ${config.pre-commit.installationScript}
        '';
      };
    };
  };
}
