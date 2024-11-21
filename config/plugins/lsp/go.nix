{ pkgs, ... }:
{
  plugins = {
    # Enable native LSP
    lsp = {
      enable = true;
      servers = {
        # Go Language Server (gopls)
        gopls = {
          enable = true;
          settings = {
            analyses = {
              unusedparams = true;
              shadow = true;
            };
            staticcheck = true;
            gofumpt = true;
          };
        };
      };
    };

    # Additional Go development tools
    lspkind.enable = true;

    # Completion
    cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };

    # Debugging support
    dap = {
      enable = true;
      adapters = {
        servers = {
          "go" = {
            type = "executable";
            command = "dlv";
            args = [ "dap" ];
          };
        };
      };
    };
  };

  # Keymappings for Go development
  keymaps = [
    # LSP Key Bindings
    {
      mode = "n";
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      options.desc = "Go to Definition";
    }
    {
      mode = "n";
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      options.desc = "Show Hover Information";
    }
    {
      mode = "n";
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      options.desc = "Code Actions";
    }

    # Go Specific Keymaps
    {
      mode = "n";
      key = "<leader>gi";
      action = "<cmd>GoInstallDeps<CR>";
      options.desc = "Install Go Dependencies";
    }
    {
      mode = "n";
      key = "<leader>gt";
      action = "<cmd>GoTest<CR>";
      options.desc = "Run Go Tests";
    }
  ];

  # Additional Go-specific configurations
  extraConfigLua = ''
    -- Go-specific autocommands
    vim.api.nvim_create_augroup("GoAutoFormat", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "GoAutoFormat",
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.format({ async = false })
      end
    })
  '';

  # Recommended Go development tools
  extraPackages = with pkgs; [
    go
    gopls
    go-tools # Contains staticcheck, etc.
    delve # Go debugger
    gofumpt # Stricter gofmt
    golangci-lint
  ];
}
