# ./modules/nvim-config-basic.nix
{
  config,
  pkgs,
  lib,
  ...
}@args:
{
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      assembly.enable = false;
      bash = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = [
            "shellcheck"
          ];
        };
        format = {
          enable = true;
          type = [
            "shfmt"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "bash-language-server"
          ];
        };
        treesitter.enable = true;
      };
      clang.enable = false;
      dart = {
        enable = false; # error: attribute 'flutter-tools' missing
        extensions = {
          flutter-tools = {
            enable = false;
          };
        };
      };
      gleam.enable = false;
      go = {
        enable = true;
        dap.enable = true;
        format = {
          enable = true;
          type = [
            "gofmt"
            "goimports"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "gopls"
          ];
        };
        treesitter.enable = true;
      };
      haskell.enable = false;
      java.enable = false;
      json = {
        enable = true;
        format = {
          enable = true;
          type = [
            "jsonfmt"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "vscode-json-language-server"
          ];
        };
        treesitter.enable = true;
      };
      jq = {
        enable = true;
        format = {
          enable = true;
          type = [
            "jqfmt"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "jq-lsp"
          ];
        };
        treesitter.enable = true;
      };
      kotlin.enable = false;
      lua = {
        enable = true;
        extensions.lazydev.enable = true;
        treesitter.enable = true;
      };
      markdown = {
        enable = true;
        format = {
          enable = true;
          type = [
            "mdformat"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "marksman"
          ];
        };
        treesitter.enable = true;
      };
      nix = {
        enable = true;
        extraDiagnostics = {
          enable = true;
          types = [
            "statix"
            "deadnix"
          ];
        };
        format.type = [
          "nixfmt"
        ];
        lsp.servers = [
          "nil"
          "nixd"
        ];
      };
      python = {
        enable = true;
        format = {
          enable = true;
          type = [
            "ruff"
            "ruff-fix"
            "isort"
          ];
        };
        dap.enable = true;
        lsp = {
          enable = true;
          servers = [
            "basedpyright"
            "ruff"
          ];
        };
        extraDiagnostics.types = [
          "mypy"
        ];
        treesitter.enable = true;
      };
      r.enable = false;
      ruby.enable = false;
      rust = {
        enable = true;
        extensions.crates-nvim.enable = true;
        dap.enable = true;
        treesitter.enable = true;
      };
      sql.enable = false;
      terraform.enable = false;
      toml = {
        enable = true;
        format = {
          enable = true;
          type = [
            "taplo"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "taplo"
          ];
        };
        treesitter.enable = true;
      };
      typescript.enable = false;
      typst = {
        enable = false;
        format = {
          type = [
            "typstyle"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "tinymist"
          ]; # typst-lsp tinymist
        };
        treesitter = {
          enable = true;
        };
        extensions = {
          typst-concealer = {
            enable = true;
            mappings = {
              toggleConcealing = "<leader>TT";
            };
            setupOpts = {
              enabled_by_default = false;
              color = "rgb(\"#f012be\")";
              conceal_in_normal = false;
              do_diagnostics = true;
              ppi = 144; # 144 300
              styling_type = "colorscheme"; # simple, none, colorscheme
            };
          };
          typst-preview-nvim = {
            enable = false;
            setupOpts = {
              extra_args = [
                "--input=ver=draft"
                "--ignore-system-fonts"
              ];
              open_cmd = "firefox %s -P typst-preview --class typst-preview";
            };
          };
        };
      };
      xml = {
        enable = true;
        lsp = {
          enable = true;
          servers = [
            "lemminx"
          ];
        };
        treesitter.enable = true;
      };
      yaml = {
        enable = true;
        format = {
          enable = true;
          type = [
            "prettier"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "yaml-language-server"
            "gitlab-ci-ls"
          ];
        };
        treesitter.enable = true;
      };
      just = {
        enable = true;
        format = {
          enable = true;
          type = [
            "just"
          ];
        };
        lsp = {
          enable = true;
          servers = [
            "just-lsp"
          ];
        };
        treesitter.enable = true;
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lspSignature.enable = true; # not using blink-cmp's lsp signature
      lspsaga.enable = true;
      lspconfig = {
        enable = true;
      };
      otter-nvim.enable = true;
      null-ls = {
        enable = lib.mkDefault false;
      };
      presets = {
        python-lsp-server.enable = true;
        nil.enable = true;
        nixd.enable = true;
        just-lsp.enable = true;
      };
      servers = {
        python-lsp-server = {
          filetypes = [
            "py"
          ];
        };
        nil = {
          filetypes = [
            "nix"
          ];
        };
        nixd = {
          filetypes = [
            "nix"
          ];
        };
      };
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

    debugger = {
      nvim-dap = {
        enable = true;
        ui = {
          enable = true;
          autoStart = true;
        };
      };
    };

    diagnostics = {
      enable = true;
      nvim-lint = {
        enable = true;
        lint_after_save = true;
      };
      config = {
        virtual_lines = false; # underneath
        virtual_text = true; # at the end of the line
      };
    };

    fzf-lua = {
      enable = true;
      profile = "telescope";
      setupOpts.winopts.border = "rounded";
    };

    notes = {
      neorg = {
        enable = false;
        treesitter = {
          enable = true;
        };
      };
      obsidian = {
        enable = false; # workspace not working, is it the $HOME var?
        setupOpts.daily_notes = {
          folder = "$HOME/obsidian-workspace"; # this should be a symlink to the real workspace
          date_format = "YYYY-MM-DD";
        };
      };
      todo-comments = {
        enable = true;
      };
    };

    tabline = {
      nvimBufferline = {
        enable = true;
      };
    };

    mini.surround.enable = true;
    mini.tabline.enable = true;

    utility.ccc.enable = true;
    utility.csvview.enable = true;
    utility.diffview-nvim.enable = true;
    utility.icon-picker.enable = true;
    utility.images.image-nvim.enable = true;
    utility.outline.aerial-nvim.enable = true;
    utility.yanky-nvim.enable = true;
    utility.yanky-nvim.setupOpts.ring.storage = "sqlite";

    options.mouse = "v";

    dashboard = {
      alpha.enable = false;
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

    formatter = {
      conform-nvim = {
        presets = {
          isort.enable = true;
          black.enable = false;
          ruff.enable = true;
          ruff-fix.enable = true;
          shfmt.enable = true;
          taplo.enable = true;
          jsonfmt.enable = true;
          jqfmt.enable = true;
          just.enable = true;
          rustfmt.enable = true;
          mdformat.enable = true;
          dockerfmt.enable = true;
          gofmt.enable = true;
          gofumpt.enable = false;
          goimports.enable = true;
          clang-format.enable = true;
          gawk.enable = true;
        };
        setupOpts = {
          formatters = {
            isort.append_args = [
              "--profile=black"
              "--multi-line=3"
              "--wrap-length=10"
              "--line-length=11"
              "--dont-follow-links"
              "--ensure-newline-before-comments"
            ];
            black.append_args = [
              "--line-length=120"
            ];
            ruff.append_args = [
              "--line-length=120"
            ];
            shfmt.append_args = [
              "--indent=0"
              "--case-indent"
              "--space-redirects"
              "--keep-padding"
            ];
            taplo.append_args = [
              "--option=align_entries=true"
              "--option=align_comments=true"
              "--option=array_trailing_comma=true"
              "--option=array_auto_expand=true"
              "--option=array_auto_collapse=false"
              "--option=column_width=1"
              "--option=indent_tables=true"
              "--option=indent_entries=false"
              "--option=indent_string=  "
              "--option=trailing_newline=true"
              "--option=reorder_keys=true"
              "--option=reorder_arrays=true"
              "--option=reorder_inline_tables=true"
              "--option=allowed_blank_lines=1"
            ];
            jsonfmt.append_args = [
              "--indent=  "
            ];
            jqfmt.append_args = [
              "-ar"
              "-ob"
              "-op pipe"
              # "-op comma,add,sub,mul,div,mod,eq,ne,gt,lt,ge,le,and,or,alt,assign,modify,updateAdd,updateSub,updateMul,updateDiv,updateMod,updateAlt"
            ];
            mdformat.append_args = [
              "--wrap=120"
              "--end-of-line=lf"
              "--number"
            ];
          };
        };
      };
    };
  };
}
