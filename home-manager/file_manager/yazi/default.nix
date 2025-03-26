{ pkgs, ... }:
let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "5186af7984aa8cb0550358aefe751201d7a6b5a8";
    hash = "sha256-Cw5iMljJJkxOzAGjWGIlCa7gnItvBln60laFMf6PSPM=";
  };
  gruvbox-flavor = pkgs.fetchFromGitHub {
    owner = "bennyyip";
    repo = "gruvbox-dark.yazi";
    rev = "b4cc9f2a3016f9b5a9bbb5aeb4619d029ee61397";
    hash = "sha256-9ZZHXP0Junaj6r80nE8oDNEU5WIKVdtz4g72BFzcSAM=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";
    initLua = ''
      require("full-border"):setup()
      require("smart-enter"):setup {
      	open_multi = true,
      }
      require("git"):setup()
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
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
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
          run = "cd ~/Documents/Notes";
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
        dark = "gruvbox";
      };
    };
    flavors = {
      gruvbox = "${gruvbox-flavor}";
    };
    plugins = {
      git = "${yazi-plugins}/git.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      toggle-pane = "${yazi-plugins}/toggle-pane.yazi";
      smart-enter = "${yazi-plugins}/smart-enter.yazi";
    };
  };
}
