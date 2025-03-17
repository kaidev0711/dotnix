{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      pipes = "pipes-rs";
      cp = "cp -i";
      rm = "rm -i";
      mv = "mv -i";
      mkdir = "mkdir -p";
      ip = "ipconfig getifaddr en0";
      rmds = "fd -H '^\.DS_Store$' -tf -X rm -i";
      info = "macchina";
      zjr = "${pkgs.zellij}/bin/zellij --layout ${config.xdg.configHome}/zellij/layouts/rust.kdl";
      zj = "${pkgs.zellij}/bin/zellij";
      cat = "${pkgs.bat}/bin/bat";
      gt = "${pkgs.gitui}/bin/gitui";
      ju = "${pkgs.just}/bin/just";
      pre = "${pkgs.presenterm}/bin/presenterm";
    };
    plugins = [ ];
    functions = {
      fish_greeting = '''';
      mkcd = ''
        mkdir -p $argv[1]
        and cd $argv[1]
      '';
      aesw = ''
        set selected_window (aerospace list-windows --all | tv)

        if test -n "$selected_window"
            set window_id (echo $selected_window | awk '{print $1}')
            aerospace focus --window-id $window_id
        end
      '';
    };
    shellAbbrs = { };
    shellInit = ''
      set -x LANG en_US.UTF-8
      set -x LC_ALL en_US.UTF-8
      # EDITOR
      set -x EDITOR "hx"

      # Rust
      set -x PATH $PATH ${config.home.homeDirectory}/.cargo/bin
      set -x PATH $PATH "/opt/homebrew/bin"
      set -x XDG_CONFIG_HOME "${config.home.homeDirectory}/.config"
      set -x PATH $PATH "${config.home.homeDirectory}/.local/bin"

      tv init fish | source

      set -l foreground DCD7BA normal
      set -l selection 2D4F67 brcyan
      set -l comment 727169 brblack
      set -l red C34043 red
      set -l orange FF9E64 brred
      set -l yellow C0A36E yellow
      set -l green 76946A green
      set -l purple 957FB8 magenta
      set -l cyan 7AA89F cyan
      set -l pink D27E99 brmagenta

      # Syntax Highlighting Colors
      set -g fish_color_normal $foreground
      set -g fish_color_command $cyan
      set -g fish_color_keyword $pink
      set -g fish_color_quote $yellow
      set -g fish_color_redirection $foreground
      set -g fish_color_end $orange
      set -g fish_color_error $red
      set -g fish_color_param $purple
      set -g fish_color_comment $comment
      set -g fish_color_selection --background=$selection
      set -g fish_color_search_match --background=$selection
      set -g fish_color_operator $green
      set -g fish_color_escape $pink
      set -g fish_color_autosuggestion $comment

      # Completion Pager Colors
      set -g fish_pager_color_progress $comment
      set -g fish_pager_color_prefix $cyan
      set -g fish_pager_color_completion $foreground
      set -g fish_pager_color_description $comment

    '';
  };
}
