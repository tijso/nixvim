{ pkgs, ... }:
{
  colorschemes.tokyonight = {
    enable = true;
    settings = {
      # style = "night";
      style = "moon";
      terminal_colors = true;
      transparent = true;
      styles = {
        sidebars = "transparent";
        floats = "transparent";
      };
      # colors = {
      #   bg = "#011628";
      #   bg_dark = "#011423";
      #   bg_float = "#011423";
      #   bg_highlight = "#143652";
      #   bg_popup = "#011423";
      #   bg_search = "#0A64AC";
      #   bg_sidebar = "#011423";
      #   bg_statusline = "#011423";
      #   bg_visual = "#275378";
      #   border = "#547998";
      #   fg = "#CBE0F0";
      #   fg_dark = "#B4D0E9";
      #   fg_float = "#CBE0F0";
      #   fg_gutter = "#627E97";
      #   fg_sidebar = "#B4D0E9";
      # };
    };
    package = pkgs.vimPlugins.tokyonight-nvim;
  };
}
