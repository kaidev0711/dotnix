{
  pkgs,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        live_config_reload = true;
      };
      window = {
        decorations = "Buttonless";
        startup_mode = "Maximized";
        dynamic_padding = true;
        dynamic_title = false;
        opacity = 1.0;
        # blur = true;
        option_as_alt = "Both";
        padding = {
          x = 2;
          y = 2;
        };
      };
      font = {
        normal = {
          family = lib.mkForce "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        italic = {
          family = lib.mkForce "FiraCode Nerd Font Mono";
          style = "Italic";
        };
        bold = {
          family = lib.mkForce "FiraCode Nerd Font Mono";
          style = "Bold";
        };
        bold_italic = {
          family = lib.mkForce "FiraCode Nerd Font Mono";
          style = "Bold Italic";
        };
        size = lib.mkForce 17;
        glyph_offset = {
          x = 0;
          y = 0;
        };
        offset = {
          x = 0;
          y = 0;
        };
      };
      colors = {
        draw_bold_text_with_bright_colors = true;
      };
      bell = {
        animation = "EaseOutExpo";
        duration = 0;
      };
      # selection = { };
      cursor = {
        style = {
          shape = "Beam";
          # blinking = "Always";
        };
      };
      terminal = {
        shell = {
          program = "${pkgs.nushell}/bin/nu";
        };
      };
      mouse = {
        hide_when_typing = true;
      };
      env = {
        TERM = "xterm-256color";
      };
    };
  };
}
