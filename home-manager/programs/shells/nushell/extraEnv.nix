{
  config,
  pkgs,
  ...
}: {
  programs.nushell = {
    extraEnv = ''
      $env.SHELL = "${pkgs.nushell}/bin/nu"
      $env.EDITOR = "hx"
      $env.VISUAL = "hx"
      $env.GPG_TTY = (tty)
      $env.LANG = "en_US.UTF-8";
      $env.LC_CTYPE = "en_US.UTF-8";
      $env.LC_ALL = "en_US.UTF-8";
      $env.DOCKER_BUILDKIT = "1"
      $env.COMPOSE_DOCKER_CLI_BUILD = "1"

      $env.NU_LIB_DIRS = $NU_LIB_DIRS ++ [ "${pkgs.nu_scripts}/share/nu_scripts" ]

      $env.GOPATH = ($env.HOME + "/go:" + $env.HOME + "/devs/_go")
      $env.GOBIN = ($env.HOME + "/go/bin")

      use std/util "path add"
      path add ($env.HOME + "/.local/bin")
      path add ($env.HOME + "/.cargo/bin")
      path add ($env.HOME + "/.krew/bin")
      path add ($env.HOME + "/go/bin")
      path add "/nix/var/nix/profiles/default/bin"
      path add "/run/current-system/sw/bin"
      path add "/etc/profiles/per-user/${config.home.username}/bin"
      path add ($env.HOME + "/.nix-profile/bin")
      path add "/opt/homebrew/bin"
      path add "/opt/homebrew/sbin"
      path add "/usr/local/bin"
      path add "/usr/local/sbin"
      path add "/usr/sbin"
      path add "/usr/bin"
      path add "/bin"
      path add "/sbin"

      $env.PATH = ($env.PATH | uniq)

      # Nu_resources
      source "${config.home.homeDirectory}/Dotnix/home-manager/programs/shells/nushell/resource/rust.nu"

      # Nu_modules
      source "${config.home.homeDirectory}/Dotnix/home-manager/programs/shells/nushell/modules/broot.nu"

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

      # television
      mkdir ($nu.data-dir | path join "vendor/autoload")
      tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")
    '';
  };
}
