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
    bash = {
      enable = true;
      extraDiagnostics.enable = true;
    };
    clang.enable = true;
    dart = {
      enable = false; # error: attribute 'flutter-tools' missing
      flutter-tools = {
        enable = true;
        color = {
          enable = true;
          virtualText.enable = true;
        };
      };
    };
    gleam.enable = true;
    go = {
      enable = true;
      dap.enable = true;
    };
    haskell.enable = true;
    java.enable = true;
    kotlin.enable = true;
    lua = {
      enable = true;
      lsp.lazydev.enable = true;
    };
    markdown.enable = true;
    nix = {
      enable = true;
      extraDiagnostics = {
        enable = true;
        types = [
          "statix"
          "deadnix"
        ];
      };
      format.type = "nixfmt";
      lsp.server = "nil";
    };
    python = {
      enable = true;
      format.type = "black-and-isort";
      dap.enable = true;
      lsp.server = "basedpyright";
    };
    r.enable = true;
    ruby.enable = true;
    rust = {
      enable = true;
      crates.enable = true;
      dap.enable = true;
    };
    sql.enable = true;
    terraform.enable = true;
    ts.enable = true;
    typst.enable = true;
  };

  lsp = {
    enable = true;
    formatOnSave = true;
    lspSignature.enable = true; # not using blink-cmp's lsp signature
    lsplines.enable = true;
    lspsaga.enable = true;
    otter-nvim.enable = true;
  };

  spellcheck = {
    enable = true;
    extraSpellWords = {
      "en.utf-8" = [
        "vpayno"
        "payno"
        "Payno"
        "nix"
        "nvf"
        "Nix"
        "NixOS"
        "nixos"
        "github"
        "GitHub"
        "gitlab"
        "GitLab"
        "aarch64"
        "macOS"
        "macos"
        "osx"
        "OSX"
      ];
    };
    programmingWordlist.enable = true;
  };

  statusline.lualine.enable = true;
  telescope.enable = true;
  autocomplete = {
    blink-cmp = {
      enable = false;
      setupOpts.signature.enabled = false;
    };
    nvim-cmp.enable = true;
  };

  autopairs.nvim-autopairs.enable = false;

  globals = {
    editorconfig = true;
  };

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

  binds = {
    cheatsheet.enable = true;
    whichKey.enable = true;
  };

  ui = {
    illuminate.enable = true;

    smartcolumn = {
      enable = true;
      setupOpts.colorcolumn = [
        "80"
        "120"
        "240"
      ];
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
