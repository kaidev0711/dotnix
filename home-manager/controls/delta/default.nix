{...}: {
  programs.delta = {
    enable = true;
    options = {
      navigate = true;
      side-by-side = true;
      line-numbers = true;
    };
  };
  catppuccin.delta = {
    enable = true;
    flavor = "mocha";
  };
}
