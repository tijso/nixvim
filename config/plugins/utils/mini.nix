{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      icons = { };
      # mockDevIcons = true;
      surround = { };
      indentscope = {
        symbol = "│";
        options = {
          try_as_border = true;
        };
      };
    };
  };
}
