{ pkgs, ... }:
{
  programs.zed-editor = {
    userSettings = {
      disable_ai = true;
      vim_mode = true;
      base_keymap = "VSCode";
      ui_font_family = "FiraCode Nerd Font Mono";
      ui_font_size = 16;
      buffer_font_family = "FiraCode Nerd Font Mono";
      buffer_font_size = 16;
      terminal = {
        font_family = "FiraCode Nerd Font Mono";
        env = {
          EDITOR = "zed --wait";
        };
        shell = {
          program = "${pkgs.nushell}/bin/nu";
        };
        toolbar = {
          breadcrumbs = false;
        };
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };
  };
}
