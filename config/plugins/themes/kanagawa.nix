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
      overrides = {
        SignColumn = {
          bg = "none";
        };
        FoldColumn = {
          bg = "none";
        };
        LineNr = {
          bg = "none";
        };
        GitSignsAdd = {
          bg = "none";
        };
        GitSignsChange = {
          bg = "none";
        };
        GitSignsDelete = {
          bg = "none";
        };
      };
    };
    package = pkgs.vimPlugins.kanagawa-nvim;
  };
}
