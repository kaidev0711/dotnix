{ inputs, pkgs, ... }:
{
  programs.television = {
    enable = true;
    package = inputs.television.packages."${pkgs.system}".default;
    settings = {
      tick_rate = 50;
      default_channel = "files";
      history_size = 200;
      global_history = false;
      ui = {
        use_nerd_font_icons = false;
        ui_scale = 100;
        input_bar_position = "top";
        orientation = "landscape";
        theme = "default";
        preview_size = 50;
        features = {
          preview_panel = {
            enabled = true;
            visible = true;
          };
          help_panel = {
            enabled = true;
            visible = false;
          };
          status_bar = {
            enabled = true;
            visible = true;
          };
          remote_control = {
            enabled = true;
            visible = false;
          };
        };
        status_bar = {
          separator_open = "";
          separator_close = "";
        };
        preview_panel = {
          size = 50;
          scrollbar = true;
        };
        remote_control = {
          show_channel_descriptions = true;
          sort_alphabetically = true;
        };
      };
      keybindings = {
        quit = [
          "esc"
          "ctrl-c"
        ];
        select_next_entry = [
          "down"
          "ctrl-n"
          "ctrl-j"
        ];
        select_prev_entry = [
          "up"
          "ctrl-p"
          "ctrl-k"
        ];
        select_prev_history = "ctrl-up";
        select_next_history = "ctrl-down";
        toggle_selection_down = "tab";
        toggle_selection_up = "backtab";
        confirm_selection = "enter";
        scroll_preview_half_page_down = [
          "pagedown"
          "mousescrolldown"
        ];
        scroll_preview_half_page_up = [
          "pageup"
          "mousescrollup"
        ];
        copy_entry_to_clipboard = "ctrl-y";
        reload_source = "ctrl-r";
        cycle_sources = "ctrl-s";
        toggle_remote_control = "ctrl-t";
        toggle_preview = "ctrl-o";
        toggle_help = "ctrl-h";
        toggle_status_bar = "f12";
      };
      shell_integration = {
        fallback_channel = "files";
        channel_triggers = {
          "alias" = [
            "alias"
            "unalias"
          ];
          "env" = [
            "export"
            "unset"
          ];
          "dirs" = [
            "cd"
            "ls"
            "rmdir"
          ];
          "files" = [
            "cat"
            "less"
            "head"
            "tail"
            "vim"
            "nano"
            "bat"
            "cp"
            "mv"
            "rm"
            "touch"
            "chmod"
            "chown"
            "ln"
            "tar"
            "zip"
            "unzip"
            "gzip"
            "gunzip"
            "xz"
          ];
          "git-diff" = [
            "git add"
            "git restore"
          ];
          "git-branch" = [
            "git checkout"
            "git branch"
            "git merge"
            "git rebase"
            "git pull"
            "git push"
          ];
          "git-log" = [
            "git log"
            "git show"
          ];
          "docker-images" = [ "docker run" ];
          "git-repos" = [
            "nvim"
            "code"
            "hx"
            "git clone"
          ];
        };
        keybindings = {
          "smart_autocomplete" = "ctrl-t";
          "command_history" = "ctrl-r";
        };
      };
    };
  };
}
