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
      zj = "${pkgs.zellij}/bin/zellij";
      cat = "${pkgs.bat}/bin/bat";
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
    shellAbbrs = {
      gt = "gitui";
      ju = "just";
      pre = "presenterm";
    };
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

    '';
  };
}
