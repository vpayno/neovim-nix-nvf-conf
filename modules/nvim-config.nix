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

    assembly.enable = true;
    bash.enable = true;
    clang.enable = true;
    dart.enable = true;
    gleam.enable = true;
    go.enable = true;
    haskell.enable = true;
    java.enable = true;
    kotlin.enable = true;
    lua = {
      enable = true;
      lsp.neodev.enable = true;
    };
    markdown.enable = true;
    nix.enable = true;
    python = {
      enable = true;
      format.type = "black-and-isort";
    };
    r.enable = true;
    rust.enable = true;
    sql.enable = true;
    terraform.enable = true;
    ts.enable = true;
    typst.enable = true;
  };

  lsp = {
    enable = true;
    formatOnSave = true;
    lspSignature.enable = true;
    lsplines.enable = true;
    lspsaga.enable = true;
  };

  spellcheck = {
    enable = true;
    extraSpellWords = {
      "en.utf-8" = [
        "nix"
        "nvf"
      ];
    };
    programmingWordlist.enable = true;
  };

  statusline.lualine.enable = true;
  telescope.enable = true;
  autocomplete.nvim-cmp.enable = true;

  enableEditorconfig = true;

  git = {
    enable = true;
    vim-fugitive.enable = true;
  };

  filetree.nvimTree.setupOpts.git = {
    enable = true;
  };

  filetree.neo-tree.setupOpts = {
    enable_git_status = true;
  };

  lazy = {
    enable = true;
  };

  comments.comment-nvim.enable = true;

  binds.whichKey.enable = true;

  ui = {
    illuminate.enable = true;

    smartcolumn = {
      enable = true;
      setupOpts.colorcolumn = ["80" "120" "240"];
    };

    borders.plugins.which-key.enable = true;
    borders.plugins.which-key.style = "rounded";
  };

  utility.outline.aerial-nvim.enable = true;

  options.mouse = "v";

  dashboard = {
    dashboard-nvim.enable = true;
    startify.enable = true;
  };

  visuals = {
    nvim-scrollbar.enable = true;
    indent-blankline.setupOpts.whitespace = {
      highlight = true;
      remove_blankline_trail = true;
    };
  };
}
