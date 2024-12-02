{
  plugins = {
    copilot-chat = {
      enable = true;
      # Additional configuration options for more robust experience
      settings = {
        # Configure default behavior
        debug = false; # Disable debug mode in production
        auto_follow_cursor = true; # Automatically follow cursor context
        show_help = true; # Show helpful tips and guidance
      };
    };
  };

  keymaps = [
    # Core Navigation and Interaction
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cc";
      action = "<CMD>CopilotChatToggle<CR>";
      options.desc = "Toggle Copilot Chat Window";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cs";
      action = "<CMD>CopilotChatStop<CR>";
      options.desc = "Stop current Copilot output";
    }

    # Code Understanding Commands
    {
      mode = [ "v" ];
      key = "<leader>ce";
      action = "<CMD>CopilotChatExplain<CR>";
      options.desc = "Explain selected code in detail";
    }
    {
      mode = [ "v" ];
      key = "<leader>cr";
      action = "<CMD>CopilotChatReview<CR>";
      options.desc = "Get a comprehensive code review";
    }

    # Documentation and Learning
    {
      mode = [ "v" ];
      key = "<leader>cd";
      action = "<CMD>CopilotChatDocs<CR>";
      options.desc = "Generate comprehensive documentation";
    }

    # Code Improvement and Expansion
    {
      mode = [ "v" ];
      key = "<leader>cp";
      action = "<CMD>CopilotChatTests<CR>";
      options.desc = "Generate unit tests for selected code";
    }
    {
      mode = [ "v" ];
      key = "<leader>cq";
      action = "<CMD>CopilotChatOptimize<CR>";
      options.desc = "Optimize and refactor selected code";
    }

    # Learning and Debugging Aids
    {
      mode = [ "v" ];
      key = "<leader>cb";
      action = "<CMD>CopilotChatBugs<CR>";
      options.desc = "Identify potential bugs in code";
    }
    {
      mode = [ "n" ];
      key = "<leader>ch";
      action = "<CMD>CopilotChatHelp<CR>";
      options.desc = "Open interactive coding help";
    }
  ];

  # Optional: Autocommands for additional context
  autoCmd = [
    {
      event = [
        "BufReadPost"
        "BufNewFile"
      ];
      pattern = [
        "*.py"
        "*.js"
        "*.ts"
        "*.cpp"
        "*.java"
      ];
      callback = ''
        function()
          -- Automatically suggest context-aware help for common file types
          require('copilot-chat').setup_buffer()
        end
      '';
    }
  ];

  # Recommended plugins for learning
  plugins = {
    # Add syntax highlighting and language server support
    treesitter.enable = true;
    lspconfig.enable = true;

    # Added for better learning experience
    which-key = {
      enable = true;
      config = {
        triggers = "auto";
        window = {
          border = "single";
          position = "bottom";
        };
      };
    };
  };
}
