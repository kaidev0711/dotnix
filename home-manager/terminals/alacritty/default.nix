{ pkgs, ... }:
{
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
        opacity = 0.8;
        # blur = true;
        option_as_alt = "Both";
        padding = {
          x = 2;
          y = 2;
        };
      };
      font = {
        normal = {
          family = "Hack Nerd Font Mono";
          style = "Regular";
        };
        italic = {
          family = "Hack Nerd Font Mono";
          style = "Italic";
        };
        bold = {
          family = "Hack Nerd Font Mono";
          style = "Bold";
        };
        bold_italic = {
          family = "Hack Nerd Font Mono";
          style = "Bold Italic";
        };
        size = 16;
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
          program = "${pkgs.fish}/bin/fish";
        };
      };
      mouse = {
        hide_when_typing = true;
      };
      env = {
        TERM = "xterm-256color";
      };
      colors = {
        primary = {
          background = "#1f1f28";
          foreground = "#dcd7ba";
        };
        normal = {
          black = "#090618";
          red = "#c34043";
          green = "#76946a";
          yellow = "#c0a36e";
          blue = "#7e9cd8";
          magenta = "#957fb8";
          cyan = "#6a9589";
          white = "#c8c093";
        };
        bright = {
          black = "#727169";
          red = "#e82424";
          green = "#98bb6c";
          yellow = "#e6c384";
          blue = "#7fb4ca";
          magenta = "#938aa9";
          cyan = "#7aa89f";
          white = "#dcd7ba";
        };
        selection = {
          background = "#2d4f67";
          foreground = "#c8c093";
        };
        indexed_colors = [
          {
            index = 16;
            color = "#ffa066";
          }
          {
            index = 17;
            color = "#ff5d62";
          }
        ];
      };
    };
  };
}
