{
  config,
  pkgs,
  ...
}: {
  programs.broot = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = false;
    settings = {
      modal = true;
      initial_mode = "command";
      default_flags = "-gh";
      true_colors = true;
      show_selection_mark = true;
      syntax_theme = "OceanDark";
      content_search_max_file_size = "10MB";
      enable_kitty_keyboard = false;
      lines_before_match_in_preview = 1;
      lines_after_match_in_preview = 1;
      icon_theme = "nerdfont";
      ext-colors = {
        png = "rgb(255, 128, 75)";
        rs = "ansi(208)";
        toml = "ansi(105)";
      };
      imports = [
        {
          file = "skins/native-16.hjson";
          luma = [
            "dark"
            "unknown"
          ];
        }
      ];
      special_paths = {
        "/media" = {
          list = "never";
          sum = "never";
        };
        "~/.config" = {
          show = "always";
        };
        "trav" = {
          show = "always";
          list = "always";
          sum = "never";
        };
        ".git" = {
          show = "never";
          list = "never";
          sum = "never";
        };
        "target" = {
          show = "default";
          list = "default";
          sum = "never";
        };
        "~/Documents" = {
          show = "always";
          list = "always";
          sum = "always";
        };
      };
      preview_transformers = [
        {
          input_extensions = ["json"];
          output_extension = "json";
          mode = "text";
          command = ["${pkgs.jq}/bin/jq"];
        }
      ];
      verbs = [
        {
          invocation = "edit";
          key = "ctrl-e";
          shortcut = "e";
          execution = "$EDITOR +{line} {file}";
          apply_to = "text_file";
          leave_broot = false;
        }
        {
          invocation = "create {subpath}";
          execution = "$EDITOR {directory}/{subpath}";
          leave_broot = false;
        }
        {
          invocation = "git_diff";
          shortcut = "gd";
          leave_broot = false;
          execution = "git difftool -y {file}";
        }
        {
          invocation = "backup {version}";
          key = "ctrl-b";
          leave_broot = false;
          auto_exec = false;
          execution = "cp -r {file} {parent}/{file-stem}-{version}{file-dot-extension}";
        }
        {
          invocation = "terminal";
          key = "ctrl-t";
          execution = "$SHELL";
          set_working_dir = true;
          leave_broot = false;
        }
        {
          shortcut = "rs";
          key = "alt-shift-r";
          internal = ":focus ~/Devs/_rust/";
        }
        {
          invocation = "home";
          key = "alt-shift-h";
          internal = ":focus ~";
        }
        {
          key = "ctrl-o";
          internal = ":open_preview";
        }
        {
          key = "ctrl-c";
          internal = ":close_preview";
        }
        {
          key = "ctrl-h";
          internal = ":panel_left";
        }
        {
          key = "ctrl-h";
          internal = ":panel_left_no_open";
        }
        {
          key = "ctrl-l";
          internal = ":panel_right";
        }
        {
          key = "ctrl-l";
          internal = ":panel_right_no_open";
        }
      ];
    };
  };
}
