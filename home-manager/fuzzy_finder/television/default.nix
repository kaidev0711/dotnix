{ ... }:
{
  programs.television = {
    enable = true;
    settings = {
      tick_rate = 50;
      ui = {
        use_nerd_font_icons = true;
        ui_scale = 100;
        show_help_bar = false;
        show_preview_panel = true;
        input_bar_position = "top";
        theme = "default";
      };
      previewers = {
        file = {
          theme = "Catppuccin Mocha";
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
        select_next_page = "pagedown";
        select_prev_page = "pageup";
        scroll_preview_half_page_down = "ctrl-d";
        scroll_preview_half_page_up = "ctrl-u";
        toggle_selection_down = "tab";
        toggle_selection_up = "backtab";
        confirm_selection = "enter";
        copy_entry_to_clipboard = "ctrl-y";
        toggle_remote_control = "ctrl-r";
        toggle_send_to_channel = "ctrl-s";
        toggle_help = "ctrl-g";
        toggle_preview = "ctrl-o";
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
          files = [
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
          git-diff = [
            "git add"
            "git restore"
          ];
          git-branch = [
            "git checkout"
            "git branch"
            "git merge"
            "git rebase"
            "git pull"
            "git push"
          ];
          docker-images = [ "docker run" ];
          git-repos = [
            "nvim"
            "code"
            "hx"
            "git clone"
          ];
        };
        keybindings = {
          smart_autocomplete = "ctrl-t";
          command_history = "ctrl-r";
        };
      };
    };
    channels = { };
  };
}
