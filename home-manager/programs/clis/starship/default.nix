{pkgs, ...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings =
      (builtins.fromTOML (
        builtins.readFile "${pkgs.starship}/share/starship/presets/plain-text-symbols.toml"
      ))
      // {
        add_newline = false;
      };
  };
}
