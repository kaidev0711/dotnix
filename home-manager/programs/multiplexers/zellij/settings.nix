{pkgs, ...}: {
  programs.zellij = {
    settings = {
      plugins = {
        "compact-bar" = {
          location = "zellij:compact-bar";
          tooltip = "F1";
        };
      };
      ui.pane_frames.rounded_corners = true;
      simplified_ui = true;
      pane_frames = false;
      default_layout = "compact";
      default_shell = "${pkgs.fish}/bin/fish";
    };
  };
}
