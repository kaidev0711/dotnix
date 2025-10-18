{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    # enableFishIntegration = true;
    settings =
      {
        font-size = lib.mkForce 15;
        font-feature = ["-liga" "-dlig" "-calt"];
        background-opacity = lib.mkForce 1.0;
        window-decoration = false;
        window-padding-x = 0;
        window-padding-y = 0;

        mouse-hide-while-typing = true;
        confirm-close-surface = false;

        # macos
        macos-option-as-alt = true;

        # command = "${pkgs.fish}/bin/fish";
      }
      // lib.optionalAttrs config.programs.fish.enable {
        command = "${config.programs.fish.package}/bin/fish";
      };
  };
}
