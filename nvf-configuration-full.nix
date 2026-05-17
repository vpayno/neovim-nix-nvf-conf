# nvf-configuration-full.nix
{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./modules/nvim-config-full.nix
  ];
}
