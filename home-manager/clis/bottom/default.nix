{ ... }:
{
  programs.bottom = {
    enable = true;
    settings = {
      flags = {
        basic = true;
      };
    };
  };
  catppuccin.bottom = {
    enable = true;
    flavor = "mocha";
  };
}
