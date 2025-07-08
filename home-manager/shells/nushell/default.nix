{
  config,
  pkgs,
  ...
}:
{
  catppuccin.nushell = {
    enable = true;
    flavor = "mocha";
  };
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config.show_banner = false
      $env.config.history = {
        file_format: "sqlite"
        max_size: 5_000_000
        sync_on_enter: true
        isolation: true
      }
      $env.config.buffer_editor = "hx"
      # $env.config.color_config = (default-dark)
      def --env y [...args] {
      	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
      	yazi ...$args --cwd-file $tmp
      	let cwd = (open $tmp)
      	if $cwd != "" and $cwd != $env.PWD {
      		cd $cwd
      	}
      	rm -fp $tmp
      }

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
      # $env.XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
      $env.SHELL = "${pkgs.nushell}/bin/nu"      
      $env.EDITOR = "hx"
      $env.VISUAL = "hx"
      $env.GPG_TTY = (tty)
      $env.LANG = "en_US.UTF-8";
      $env.LC_CTYPE = "en_US.UTF-8";
      $env.LC_ALL = "en_US.UTF-8";

      $env.NU_LIB_DIRS = $NU_LIB_DIRS ++ [ "${pkgs.nu_scripts}/share/nu_scripts" ]

      use std/util "path add"
      path add "${config.home.homeDirectory}/.local/bin"
      path add "${config.home.homeDirectory}/.cargo/bin"
      path add "/opt/homebrew/bin"
      path add "/opt/homebrew/sbin"
      path add "/nix/var/nix/profiles/default/bin"
      path add "/run/current-system/sw/bin"
      path add "/etc/profiles/per-user/${config.home.username}/bin"
      path add "/usr/local/bin"
      path add "/usr/local/sbin"
      path add "/usr/sbin"
      path add "/usr/bin"
      path add "/bin"
      path add "/sbin"

      $env.PATH = ($env.PATH | uniq)

      # Nu_resources
      source "${config.home.homeDirectory}/Dotnix/home-manager/shells/nushell/resource/rust.nu" 

      # Nu_modules  
      source "${config.home.homeDirectory}/Dotnix/home-manager/shells/nushell/modules/broot.nu" 

      # Themes
      # use "${pkgs.nu_scripts}/share/nu_scripts/themes/nu-themes/default-dark.nu"


      # Nu_scripts
      ## aliases
      source "${pkgs.nu_scripts}/share/nu_scripts/aliases/git/git-aliases.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/aliases/eza/eza-aliases.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/aliases/bat/bat-aliases.nu"

      ## custom-completions
      source "${pkgs.nu_scripts}/share/nu_scripts/custom-completions/zellij/zellij-completions.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/custom-completions/nix/nix-completions.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/custom-completions/aerospace/aerospace-completions.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/custom-completions/typst/typst-completions.nu"
      source "${pkgs.nu_scripts}/share/nu_scripts/custom-completions/rg/rg-completions.nu"

      ### web completions
    '';
    shellAliases = {
      cp = "cp -i";
      rm = "rm -i";
      mv = "mv -i";
      ip = "ipconfig getifaddr en0";
      rmds = "fd -H '^\.DS_Store$' -tf -X rm -i";
      zjr = "${pkgs.zellij}/bin/zellij action new-tab -l ${config.xdg.configHome}/zellij/layouts/rust.kdl";
      zjv = "${pkgs.zellij}/bin/zellij action new-tab -l ${config.xdg.configHome}/zellij/layouts/vibes.kdl";
      vibes = "rustyvibes ${config.home.homeDirectory}/Devs/_opensource/Soundpacks/nk-cream/ -v 100";
    };
    plugins = [
      pkgs.nushellPlugins.query
    ];
  };
}
