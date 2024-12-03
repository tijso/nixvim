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
    };

    lsp = {
      enable = true;

      keymaps = {
        # Standard LSP keymaps
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

        # Custom LSP keymaps
        "n" = {
          "<leader>ldd" = "lua vim.lsp.buf.document_symbol()";
          "<leader>ldw" = "lua vim.lsp.buf.workspace_symbol()";
          "<leader>ldl" = "lua vim.diagnostic.open_float()";
          "<leader>ldq" = "lua vim.diagnostic.setqflist()";
          "<leader>lr" = "lua vim.lsp.buf.rename()";
          "<leader>la" = "lua vim.lsp.buf.code_action()";
          "<leader>lf" = "lua vim.lsp.buf.format({ async = true })";
          "<leader>lwa" = "lua vim.lsp.buf.add_workspace_folder()";
          "<leader>lwr" = "lua vim.lsp.buf.remove_workspace_folder()";
          "<leader>lwl" = "lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))";
        };
      };

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
