# nvf-configuration.nix
{
  pkgs,
  lib,
  ...
}:
{
  vim = import ./modules/nvim-config.nix;
}
