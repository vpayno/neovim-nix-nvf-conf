{
  pkgs,
  lib,
  ...
}:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = import ./modules/nvim-config.nix;
    };
  };
}
