_: {
  imports = [
    # General Configuration
    ./core/autocmd.nix
    ./core/keymaps.nix
    ./core/options.nix

    # Themes
    ./plugins/themes/default.nix

    # Completion
    ./plugins/cmp/cmp.nix
    ./plugins/cmp/cmp-copilot.nix
    ./plugins/cmp/lspkind.nix
    ./plugins/cmp/autopairs.nix
    ./plugins/cmp/schemastore.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # Editor plugins and configurations
    ./plugins/editor/copilot-chat.nix
    ./plugins/editor/illuminate.nix
    ./plugins/editor/indent-blankline.nix
    ./plugins/editor/navic.nix
    # ./plugins/editor/neo-tree.nix
    ./plugins/editor/noice.nix
    ./plugins/editor/oil.nix
    ./plugins/editor/todo-comments.nix
    ./plugins/editor/treesitter.nix
    ./plugins/editor/undotree.nix

    # UI plugins
    ./plugins/ui/alpha.nix
    ./plugins/ui/bufferline.nix
    ./plugins/ui/lualine.nix
    # ./plugins/ui/startup.nix

    # LSP and formatting
    ./plugins/lsp/conform.nix
    ./plugins/lsp/fidget.nix
    ./plugins/lsp/lsp.nix
    # ./plugins/lsp/go.nix

    # Git
    ./plugins/git/gitsigns.nix
    ./plugins/git/lazygit.nix

    # Utils
    ./plugins/utils/extra_plugins.nix
    ./plugins/utils/fzf.nix
    ./plugins/utils/harpoon.nix
    # ./plugins/utils/markdown-preview.nix
    ./plugins/utils/mini.nix
    ./plugins/utils/telescope.nix
    ./plugins/utils/toggleterm.nix
    # ./plugins/utils/trim.nix
    ./plugins/utils/whichkey.nix
    # ./plugins/utils/obsidian
  ];
}
