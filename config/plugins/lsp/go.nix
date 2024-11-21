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

    # Debug Adapter Protocol (DAP) Configuration
    dap = {
      enable = true;
      adapters = {
        go = {
          type = "executable";
          command = "dlv";
          args = [ "dap" ];
        };
      };
      configurations = {
        go = [
          {
            type = "go";
            request = "launch";
            name = "Debug Go Program";
            program = "\${file}";
          }
        ];
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
    # Debugging Keymaps
    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
      options.desc = "Toggle Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = "<cmd>lua require('dap').continue()<CR>";
      options.desc = "Continue Debugging";
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

    -- Additional Go setup
    local function go_org_imports(wait_ms)
      local params = vim.lsp.util.make_range_params()
      params.context = {only = {"source.organizeImports"}}
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
      for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
          else
            vim.lsp.buf.execute_command(r.command)
          end
        end
      end
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        go_org_imports(1000)
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
