# flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  }: let
    supportedSystems = [
      "aarch64-linux"
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    formatter = forAllSystems (system: nixpkgsFor.${system}.nixfmt-rfc-style);

    packages = {
      aarch64-linux.default =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-linux;
          modules = [./nvf-configuration.nix];
        })
        .neovim;
      x86_64-linux.default =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [./nvf-configuration.nix];
        })
        .neovim;
    };

    nixosConfiguration.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        nvf.nixosModules.default
      ];
    };
  };
}
