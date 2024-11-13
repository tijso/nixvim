{pkgs, ...}: {
    nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;

  extraPlugins = with pkgs.vimPlugins; [];
}
