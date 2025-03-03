{ pkgs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "5186af7984aa8cb0550358aefe751201d7a6b5a8";
    hash = "sha256-Cw5iMljJJkxOzAGjWGIlCa7gnItvBln60laFMf6PSPM=";
  };
  kanagawa-flavor = pkgs.fetchFromGitHub {
    owner = "dangooddd";
    repo = "kanagawa.yazi";
    rev = "31167ed54c9cc935b2fa448d64d367b1e5a1105d";
    hash = "sha256-phwGd1i/n0mZH/7Ukf1FXwVgYRbXQEWlNRPCrmR5uNk=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    initLua = ''
      require("full-border"):setup()
      require("smart-enter"):setup {
      	open_multi = true,
      }
    '';
    settings = {
      manager = {
        ratio = [
          3
          6
          9
        ];
        sort_dir_first = true;
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        linemode = "size";
        show_hidden = true;
        show_symlink = true;
        scrolloff = 5;
      };
      preview = {
        wrap = "yes";
        max_width = 1000;
        max_height = 1000;
      };
      opener = {
        bulk-rename = [
          {
            run = "$EDITOR '$@'";
            block = true;
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            name = "bulk-rename.txt";
            use = "bulk-rename";
          }
        ];
      };
      plugin = {
        prepend_preloaders = [
          {
            name = "/remote/**";
            run = "noop";
          }
        ];
      };
    };
    keymap = {
      manager.prepend_keymap = [
        {
          on = "!";
          run = "shell '$SHELL' --block --confirm";
          desc = "Open shell here";
        }
        {
          on = "<Esc>";
          run = "close";
          desc = "Cancel input";
        }
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        {
          on = [
            "g"
            "r"
          ];
          run = "cd ~/Devs/_rust";
          desc = "Go to the rust directory";
        }
        {
          on = [
            "g"
            "n"
          ];
          run = "cd ~/Notes";
          desc = "Go to the Notes directory";
        }
        {
          on = "<C-p>";
          run = "shell -- qlmanage -p '$@'";
        }
        {
          on = "T";
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }
      ];
    };
    theme = {
      flavor = {
        dark = "kanagawa";
      };
    };
    flavors = {
      kanagawa = "${kanagawa-flavor}";
    };
    plugins = {
      full-border = "${yazi-plugins}/full-border.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      smart-enter = "${yazi-plugins}/smart-enter.yazi";
    };
  };
}
