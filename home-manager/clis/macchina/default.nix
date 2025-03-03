{ ... }:
{
  imports = [
    ../../modules/macchina.nix
  ];
  programs.macchina = {
    enable = true;
    config = {
      theme = "Lithium";
      show = [
        "Machine"
        "Kernel"
        "OperatingSystem"
        "Terminal"
        "Packages"
      ];
    };
    themes = {
      Lithium = {
        spacing = 2;
        padding = 0;
        hide_ascii = true;
        separator = ">";
        key_color = "Cyan";
        separator_color = "White";

        palette = {
          type = "Full";
          visible = false;
        };

        bar = {
          glyph = "ߋ";
          symbol_open = "[";
          symbol_close = "]";
          hide_delimiters = true;
          visible = true;
        };

        box = {
          title = " TuanDV ";
          border = "plain";
          visible = true;
          inner_margin = {
            x = 1;
            y = 0;
          };
        };
        randomize = {
          key_color = false;
          separator_color = false;
        };
        keys = {
          host = "Host";
          kernel = "Kernel";
          battery = "Battery";
          os = "OS";
          de = "DE";
          wm = "WM";
          distro = "Distro";
          terminal = "Terminal";
          shell = "Shell";
          packages = "Packages";
          uptime = "Uptime";
          memory = "Memory";
          machine = "Machine";
          local_ip = "Local IP";
          backlight = "Brightness";
          resolution = "Resolution";
          cpu_load = "CPU Load";
          cpu = "CPU";
          gpu = "GPU";
          disk_space = "Disk Space";
        };
      };
    };
  };
}
