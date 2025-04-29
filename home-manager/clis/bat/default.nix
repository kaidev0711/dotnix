{ ... }:
{
  programs.bat = {
    enable = true;
    config = {
      italic-text = "always";
    };
  };
  catppuccin.bat = {
    enable = true;
    flavor = "mocha";
  };
}
