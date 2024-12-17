{ pkgs, ... }:
{
  colorschemes.kanagawa = {
    enable = true;
    settings = {
      # transparent = false;
      terminal_colors = true;
      compile = true;
      style = "wave";
      styles = {
        italic = true;
        bold = true;
        transparency = true;
      };
      theme = {
        all = {
          ui = {
            bg_gutter = "none";
          };
        };
      };
    };
    package = pkgs.vimPlugins.kanagawa-nvim;
  };
}
