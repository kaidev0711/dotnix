{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."broot/skins/catppuccin_mocha.toml".text = ''
    [skin]
    directory = "ansi(12)"
    file = "ansi(7)"
    pruning = "ansi(8) none italic"
    selected_line = "none ansi(0)"
    tree = "ansi(8)"

    # Search
    char_match = "ansi(3) none underlined"
    parent = "ansi(4) none bold"

    # File properties
    exe = "ansi(2)"
    link = "ansi(13)"
    sparse = "ansi(12)"

    # Prompt
    input = "ansi(6)"

    # Status bar
    status_bold = "ansi(7) ansi(8) bold"
    status_code = "ansi(10) ansi(8)"
    status_ellipsis = "ansi(7) ansi(8)"
    status_error = "ansi(7) ansi(8)"
    status_italic = "ansi(7) ansi(8) italic"
    status_job = "ansi(7) ansi(8)"
    status_normal = "ansi(7) ansi(8)"

    # Flag status
    flag_label = "ansi(6)"
    flag_value = "ansi(14) none bold"

    # Background
    default = "none none"
    # default = "gray(23) none / gray(20) none"


    # Scrollbar
    scrollbar_track = "ansi(0)"
    scrollbar_thumb = "ansi(3)"

    # Git
    git_branch = "ansi(13)"
    git_deletions = "ansi(1)"
    git_insertions = "ansi(2)"
    git_status_conflicted = "ansi(1)"
    git_status_current = "ansi(6)"
    git_status_ignored = "ansi(8)"
    git_status_modified = "ansi(3)"
    git_status_new = "ansi(2) none bold"
    git_status_other = "ansi(5)"

    # Staging area
    staging_area_title = "ansi(3)"

    # Documentation
    help_bold = "ansi(7) none bold"
    help_code = "ansi(4)"
    help_headers = "ansi(3)"
    help_italic = "ansi(7) none italic"
    help_paragraph = "ansi(7)"
    help_table_border = "ansi(8)"

    # Device column
    device_id_major = "ansi(5)"
    device_id_minor = "ansi(5)"
    device_id_sep = "ansi(5)"

    # Counts column
    count = "ansi(13)"

    # Dates column
    dates = "ansi(6)"

    # Permissions column
    group = "ansi(3)"
    owner = "ansi(3)"
    perm__ = "ansi(8)"
    perm_r = "ansi(3)"
    perm_w = "ansi(1)"
    perm_x = "ansi(2)"

    # Hex preview
    hex_null = "ansi(8)"
    hex_ascii_graphic = "ansi(2)"
    hex_ascii_whitespace = "ansi(3)"
    hex_ascii_other = "ansi(4)"
    hex_non_ascii = "ansi(5)"

    # Preview (commented out in original)
    # preview = "none"
    # preview_line_number = "none"
    # preview_match = "none"
    # preview_title = "none"

    # Used for displaying errors
    file_error = "ansi(1)"

    # Content searches
    content_extract = "ansi(7)"
    content_match = "ansi(3) none underlined"

    # Used in status line
    purpose_bold = "ansi(0) ansi(7) bold"
    purpose_ellipsis = "ansi(0)"
    purpose_italic = "ansi(0) ansi(7) italic"
    purpose_normal = "ansi(0)"

    # Modal indicator
    mode_command_mark = "ansi(7) ansi(4)"

    # File system occupation
    good_to_bad_0 = "ansi(2)"
    good_to_bad_1 = "ansi(2)"
    good_to_bad_2 = "ansi(2)"
    good_to_bad_3 = "ansi(2)"
    good_to_bad_4 = "ansi(2)"
    good_to_bad_5 = "ansi(1)"
    good_to_bad_6 = "ansi(1)"
    good_to_bad_7 = "ansi(1)"
    good_to_bad_8 = "ansi(1)"
    good_to_bad_9 = "ansi(1)"
  '';
  programs.broot = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = false;
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
          file = "skins/catppuccin_mocha.toml";
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
