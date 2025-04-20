{
  config,
  pkgs,
  ...
}:
{
  programs.nushell = {
    enable = true;
    settings = {
      history = {
        file_format = "sqlite";
        max_size = 5000000;
        sync_on_enter = true;
        isolation = true;
      };
      show_banner = false;
      buffer_editor = "hx";
      datetime_format = {
        table = null;
        normal = "%d/%m/%y %I:%M:%S%p";
      };
    };
    environmentVariables = {
      XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    };
    shellAliases = {
      pipes = "pipes-rs";
      cp = "cp -i";
      rm = "rm -i";
      mv = "mv -i";
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
    plugins = [
      pkgs.nushellPlugins.query
    ];
    extraConfig = ''

      $env.config.color_config = (gruvbox-dark)
      $env.config.keybindings ++= [
        {
          name: fuzzy_file
          modifier: Control
          keycode: char_t
          mode: emacs
          event: {
            send: executehostcommand
            cmd: "commandline edit --insert (tv)"
          }
        }
      ]

      alias nu-open = open
      alias open = ^open

      export def dmy [] { (date now | format date %d-%m-%Y) }
      export def ymd [] { (date now | format date %Y-%m-%d) }

      export def --env mkcd [dirname: path] {
        mkdir $dirname
        cd $dirname
      }

      def aesw [] {
        let selected_window = (aerospace list-windows --all | tv | str trim)

        if ($selected_window | is-not-empty) {
          let window_id = ($selected_window | split row " " | first)
          aerospace focus --window-id $window_id
        }
      }

    '';
    extraEnv = ''
      $env.GPG_TTY = (tty)

      $env.NU_LIB_DIRS = $NU_LIB_DIRS ++ [ "${pkgs.nu_scripts}/share/nu_scripts" ]

      use std/util "path add"
      path add "${config.home.homeDirectory}/.local/bin"
      path add "${config.home.homeDirectory}/.cargo/bin"
      path add "/opt/homebrew/bin"
      path add "/opt/homebrew/sbin"
      # path add "/usr/local/bin"
      # path add "/usr/local/sbin"
      # path add "/usr/sbin"
      # path add "/usr/bin"
      # path add "/bin"
      # path add "sbin"

      $env.PATH = ($env.PATH | uniq)

      # Nu_resources
      source "${config.home.homeDirectory}/Dotnix/home-manager/shells/nushell/resource/rust.nu" 

      # Themes
      use "${pkgs.nu_scripts}/share/nu_scripts/themes/nu-themes/gruvbox-dark.nu"


      # Nu_scripts
      ## aliases
      source "${pkgs.nu_scripts}/share/nu_scripts/aliases/git/git-aliases.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/aliases/eza/eza-aliases.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/aliases/bat/bat-aliases.nu"

      ## custom-completions
      source "${pkgs.nu_scripts}/share/nu_scripts/custom-completions/zellij/zellij-completions.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/custom-completions/cargo/cargo-completions.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/custom-completions/nix/nix-completions.nu"
    '';
  };
}
