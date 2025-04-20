{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        source = "macos2";
        padding = {
          top = 1;
        };
      };
      display = {
        color = "magenta";
        separator = "    ";
      };
      modules = [
        "break"
        {
          type = "custom";
          format = " System";
        }
        {
          type = "title";
          key = " ";
        }
        {
          type = "os";
          key = " ";
        }
        {
          type = "kernel";
          key = " ";
        }
        {
          type = "packages";
          key = " 󰏗";
        }
        {
          type = "custom";
          format = " ────────────────────────────────";
        }
        {
          type = "custom";
          format = " Hardware";
        }
        {
          type = "cpu";
          key = " ";
          format = "{}";
        }
        {
          type = "gpu";
          key = " ";
          format = "{1}, {3}";
        }
        {
          type = "memory";
          key = " ";
          format = "{1} / {2}";
        }
        {
          type = "disk";
          key = " ";
          format = "{1} / {2}";
        }
        {
          type = "custom";
          format = " ────────────────────────────────";
        }
        {
          type = "custom";
          format = " Profile";
        }
        {
          type = "wm";
          key = " 󰖯";
          format = "{}";
        }
        {
          type = "terminal";
          key = " ";
        }
        {
          type = "shell";
          key = " ";
        }
        {
          type = "uptime";
          key = " 󰥔";
        }
        {
          type = "custom";
          format = " ────────────────────────────────";
        }
        {
          type = "custom";
          format = " {#30}⬤ {#90}⬤ {#31}⬤ {#91}⬤ {#32}⬤ {#92}⬤ {#33}⬤ {#93}⬤ {#34}⬤ {#94}⬤ {#35}⬤ {#95}⬤ {#36}⬤ {#96}⬤ {#37}⬤ {#97}⬤ ";
        }
      ];
    };
  };
}
