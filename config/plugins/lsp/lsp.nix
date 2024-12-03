{
  plugins = {
    which-key = {
      enable = true;
      registrations = {
        "<leader>l" = {
          name = "+LSP";
          d = {
            name = "+Diagnostics";
            d = "Document Symbols";
            w = "Workspace Symbols";
            l = "Line Diagnostics";
            q = "Quickfix";
          };
          r = "Rename Symbol";
          a = "Code Actions";
          f = "Format Document";
          w = {
            name = "+Workspace";
            a = "Add Workspace Folder";
            r = "Remove Workspace Folder";
            l = "List Workspace Folders";
          };
        };
      };

      # Optional: Which-Key settings
      settings = {
        plugins = {
          marks = true;
          registers = true;
        };
        window = {
          border = "single";
          position = "bottom";
          margin = {
            top = 1;
            right = 1;
            bottom = 1;
            left = 1;
          };
        };
      };
    };

    lsp = {
      enable = true;

      keymaps = {
        lspBuf = {
          "K" = "hover";
          "gd" = "definition";
          "gD" = "declaration";
          "gi" = "implementation";
          "gr" = "references";
        };

        diagnostic = {
          "[d" = "goto_prev";
          "]d" = "goto_next";
        };
      };

      extraKeymaps = [
        # Diagnostic Submenu
        {
          mode = "n";
          key = "<leader>ldd";
          action = "<cmd>lua vim.lsp.buf.document_symbol()<CR>";
          options.desc = "Document Symbols";
        }
        {
          mode = "n";
          key = "<leader>ldw";
          action = "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>";
          options.desc = "Workspace Symbols";
        }
        {
          mode = "n";
          key = "<leader>ldl";
          action = "<cmd>lua vim.diagnostic.open_float()<CR>";
          options.desc = "Line Diagnostics";
        }
        {
          mode = "n";
          key = "<leader>ldq";
          action = "<cmd>lua vim.diagnostic.setqflist()<CR>";
          options.desc = "Quickfix Diagnostics";
        }

        # Other LSP Actions
        {
          mode = "n";
          key = "<leader>lr";
          action = "<cmd>lua vim.lsp.buf.rename()<CR>";
          options.desc = "Rename Symbol";
        }
        {
          mode = "n";
          key = "<leader>la";
          action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
          options.desc = "Code Actions";
        }
        {
          mode = "n";
          key = "<leader>lf";
          action = "<cmd>lua vim.lsp.buf.format({ async = true })<CR>";
          options.desc = "Format Document";
        }

        # Workspace Folder Management
        {
          mode = "n";
          key = "<leader>lwa";
          action = "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>";
          options.desc = "Add Workspace Folder";
        }
        {
          mode = "n";
          key = "<leader>lwr";
          action = "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>";
          options.desc = "Remove Workspace Folder";
        }
        {
          mode = "n";
          key = "<leader>lwl";
          action = "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>";
          options.desc = "List Workspace Folders";
        }
      ];

      servers = {
        nixd.enable = true;
        html.enable = true;
        cssls.enable = true;
        tsserver.enable = true;
        pyright.enable = true;
        rust-analyzer.enable = true;
        gopls.enable = true;
        lua-ls.enable = true;
        yamlls.enable = true;
        jsonls.enable = true;
        dockerls.enable = true;
      };
    };

    trouble = {
      enable = true;
      settings = {
        position = "bottom";
        height = 10;
        width = 50;
      };
    };
  };

  extraConfigLua = ''
    -- Additional LSP setup
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  '';
}
