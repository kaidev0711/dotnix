{
  config,
  pkgs,
  lib,
  ...
}:
let
  gruvbox = pkgs.fetchgit {
    url = "https://github.com/sujaybokil/fish-gruvbox";
    rev = "5556465864fdc0ad69c6bec47e730be02ff984a5";
    sha256 = "sha256-Xy9A6ksrA5Bon08y4qOOfyWHYcwds0Sp560pK7XY1OY=";
  };
in
{
  xdg.configFile."fish/conf.d/gruvbox.fish".source = "${gruvbox}/conf.d/gruvbox.fish";
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
      info = "${pkgs.fastfetch}/bin/fastfetch";
      zjr = "${pkgs.zellij}/bin/zellij action new-tab -l ${config.xdg.configHome}/zellij/layouts/rust.kdl";
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
      # Rust
      set -x PATH $PATH ${config.home.homeDirectory}/.cargo/bin
      set -x PATH $PATH /opt/homebrew/bin
      set -x PATH $PATH /opt/homebrew/sbin
      set -x PATH $PATH ${config.home.homeDirectory}/.local/bin
      set -x XDG_CONFIG_HOME ${config.home.homeDirectory}/.config
      set -x GPG_TTY (tty)

      tv init fish | source
    '';
  };
}
