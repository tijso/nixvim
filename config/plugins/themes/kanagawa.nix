{ pkgs, ... }:
{
  colorschemes.kanagawa = {
    enable = true;
    settings = {
      # transparent = false;
      terminal_colors = true;
      compile = true;
      style = "wave";
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none";
            };
          };
        };
      };
      styles = {
        italic = true;
        bold = true;
        transparency = true;
      };
    };
    package = pkgs.vimPlugins.kanagawa-nvim;
  };
}
