{ ... }:
{
  programs.skim = {
    enable = true;
    enableFishIntegration = false;
  };
  catppuccin.skim = {
    enable = true;
    flavor = "mocha";
  };
}
