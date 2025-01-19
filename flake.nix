# flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-24.11";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  }: let
    forAllSystems = nixpkgs.lib.genAttrs [
      "aarch64-linux"
      "x86_64-linux"
    ];

    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    formatter = forAllSystems (system: nixpkgsFor.${system}.nixfmt-rfc-style);

    packages.x86_64-linux.default =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./nvf-configuration.nix];
      })
      .neovim;

    nixosConfiguration.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        nvf.nixosModules.default
      ];
    };
  };
}
