{ pkgs, ... }:
{
  colorschemes.tokyonight = {
    enable = true;
    settings = {
      style = "night";
      terminal_colors = true;
      transparent = true;
      styles = {
        sidebars = "transparent";
        floats = "transparent";
      };
    };
    package = pkgs.vimPlugins.tokyonight-nvim;
  };
}
