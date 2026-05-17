# nvf-configuration-basic.nix
{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./modules/nvim-config-basic.nix
  ];
}
