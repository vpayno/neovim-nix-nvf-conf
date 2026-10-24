# flake.nix
{
  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixOS/nixpkgs/nixos-26.05";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf-stable = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs-stable";
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
      nixpkgs-stable,
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
        default = self.packages.${system}.full;

        basic =
          (nvf.lib.neovimConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [ ./nvf-configuration-basic.nix ];
          }).neovim;

        full =
          (nvf.lib.neovimConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};
            modules = [ ./nvf-configuration-full.nix ];
          }).neovim;

        basic-stable =
          (nvf.lib.neovimConfiguration {
            pkgs = nixpkgs-stable.legacyPackages.${system};
            modules = [ ./nvf-configuration-basic.nix ];
          }).neovim;

        full-stable =
          (nvf.lib.neovimConfiguration {
            pkgs = nixpkgs-stable.legacyPackages.${system};
            modules = [ ./nvf-configuration-full.nix ];
          }).neovim;
      });

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            name = "default";
            packages = [
              self.packages.${system}.full
            ];
            shellHook = ''
              ${pkgs.lib.getExe pkgs.cowsay} "neovim-nix-nvf-conf shell"
            '';
          };
          default-stable = pkgs.mkShell {
            name = "default";
            packages = [
              self.packages.${system}.full-stable
            ];
            shellHook = ''
              ${pkgs.lib.getExe pkgs.cowsay} "neovim-nix-nvf-conf shell"
            '';
          };
        }
      );

      nixosConfiguration.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          nvf.nixosModules.default
        ];
      };
    };
}
