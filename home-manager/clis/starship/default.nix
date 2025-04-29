{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings =
      (builtins.fromTOML (
        builtins.readFile "${pkgs.starship}/share/starship/presets/catppuccin-powerline.toml"
      ))
      // {
        add_newline = false;
      };
  };
}
