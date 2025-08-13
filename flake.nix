# flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-conf = {
      url = "github:vpayno/nix-treefmt-conf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
      treefmt-conf,
      ...
    }:
    let
      supportedSystems = [
        "aarch64-linux"
        "x86_64-linux"
        "riscv64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      formatter = forAllSystems (system: treefmt-conf.formatter.${system});

      packages = forAllSystems (system: {
        default =
          (nvf.lib.neovimConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [ ./nvf-configuration.nix ];
          }).neovim;
      });

      nixosConfiguration.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          nvf.nixosModules.default
        ];
      };
    };
}
