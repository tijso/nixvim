{pkgs, ...}: {
    nvim-autopairs.enable = true;
    nix.enable = true;
    nvim-colorizer.enable = true;
  };
  extraPlugins = with pkgs.vimPlugins; [];
}
