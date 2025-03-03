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
      zjr = "zellij action new-tab -l ${config.home.homeDirectory}/.config/zellij/layouts/rust.kdl";
    };
    plugins = [ ];
    functions = {
      fish_greeting = '''';
      mkcd = ''
        mkdir -p $argv[1]
        and cd $argv[1]
      '';
    };
    shellAbbrs = {
      gt = "gitui";
      ju = "just";
    };
    shellInit = ''
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
