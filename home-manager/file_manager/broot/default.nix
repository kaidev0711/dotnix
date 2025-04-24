{ config, pkgs, ... }:
{
  xdg.configFile."broot/skins/kanagawa.toml".text = ''
    [skin]
    default = "rgb(220, 215, 186) rgb(31, 31, 40) / rgb(54, 54, 70) rgb(42, 42, 55)"
    tree = "rgb(54, 54, 70) none"
    file = "none none"
    directory = "rgb(126, 156, 216) none bold"
    exe = "rgb(195, 64, 66) none"
    link = "rgb(149, 127, 184) none"
    pruning = "rgb(54, 54, 70) none italic"
    perm__ = "rgb(54, 54, 70) none"
    perm_r = "none none"
    perm_w = "none none"
    perm_x = "none none"
    owner = "rgb(54, 54, 70) none"
    group = "rgb(54, 54, 70) none"
    sparse = "none none"
    git_branch = "rgb(147, 138, 169) none"
    git_insertions = "rgb(118, 148, 106) none"
    git_deletions = "rgb(195, 64, 66) none"
    git_status_current = "none none"
    git_status_modified = "rgb(192, 163, 110) none"
    git_status_new = "rgb(118, 148, 106) none"
    git_status_ignored = "rgb(54, 54, 70) none"
    git_status_conflicted = "rgb(195, 64, 66) none"
    git_status_other = "rgb(195, 64, 66) none"
    selected_line = "none rgb(42, 42, 55)"
    char_match = "rgb(118, 148, 106) none underlined"
    file_error = "rgb(255, 160, 102) none italic"
    flag_label = "none none"
    flag_value = "rgb(192, 163, 110) none bold"
    input = "none none"
    status_error = "rgb(255, 160, 102) rgb(42, 42, 55)"
    status_job = "rgb(147, 138, 169) rgb(42, 42, 55) bold"
    status_normal = "none rgb(42, 42, 55)"
    status_italic = "rgb(192, 163, 110) rgb(42, 42, 55)"
    status_bold = "rgb(147, 138, 169) rgb(42, 42, 55) bold"
    status_code = "rgb(147, 138, 169) rgb(42, 42, 55)"
    status_ellipsis = "none rgb(42, 42, 55)"
    scrollbar_track = "rgb(42, 42, 55) none"
    scrollbar_thumb = "none none"
    help_paragraph = "none none"
    help_bold = "rgb(147, 138, 169) none bold"
    help_italic = "rgb(147, 138, 169) none italic"
    help_code = "rgb(147, 138, 169) rgb(42, 42, 55)"
    help_headers = "rgb(192, 163, 110) none"
    help_table_border = "none none"
    preview_title = "gray(20) rgb(31, 31, 40)"
    staging_area_title = "gray(22) rgb(31, 31, 40)"
  '';
  programs.broot = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = {
      modal = true;
      default_flags = "-gh";
      true_colors = true;
      initial_mode = "command";
      show_selection_mark = true;
      syntax_theme = "GitHub";
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
          file = "skins/kanagawa.toml";
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
          input_extensions = [ "json" ];
          output_extension = "json";
          mode = "text";
          command = [ "${pkgs.jq}/bin/jq" ];
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
          shortcut = "md";
          key = "alt-shift-d";
          internal = ":focus ${config.home.homeDirectory}/Documents/Notes";
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
