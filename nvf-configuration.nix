# nvf-configuration.nix
{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./modules/nvim-config.nix
  ];
}
