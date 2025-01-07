{
  theme = {
    enable = true;
    name = "gruvbox";
    style = "dark";
  };

  languages = {
    enableFormat = true;
    enableLSP = true;
    enableTreesitter = true;
  };

  lsp = {
    enable = true;
    formatOnSave = true;
    lspSignature.enable = true;
    lsplines.enable = true;
  };

  statusline.lualine.enable = true;
  telescope.enable = true;
  autocomplete.nvim-cmp.enable = true;
}
