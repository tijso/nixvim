{ pkgs, ... }:
{
  plugins = {
    nvim-autopairs.enable = true;
    nix.enable = true;
    colorizer.enable = true;
  };
  extraPlugins = with pkgs.vimPlugins; [ ];
}
