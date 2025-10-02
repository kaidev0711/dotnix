{config, ...}: {
  programs.fish = {
    shellInit = ''
      # set -x XDG_CONFIG_HOME ${config.home.homeDirectory}/.config
      # set -x PATH $PATH /opt/homebrew/bin
      # set -x PATH $PATH /opt/homebrew/sbin
      # set -x PATH $PATH /usr/local/bin
      # set -x PATH $PATH /usr/local/sbin
      # set -x PATH $PATH /usr/sbin
      # set -x PATH $PATH /usr/bin
      # set -x PATH $PATH /bin
      # set -x PATH $PATH /sbin

      # set -x PATH $PATH /nix/var/nix/profiles/default/bin
      # set -x PATH $PATH /run/current-system/sw/bin
      # set -x PATH $PATH /etc/profiles/per-user/${config.home.username}/bin
      # set -x PATH $PATH ${config.home.homeDirectory}/.nix-profile/bin

      # set -gx PATH $PATH ${config.home.homeDirectory}/.krew/bin

      # set -x PATH $PATH ${config.home.homeDirectory}/.local/bin
      # set -x PATH $PATH ${config.home.homeDirectory}/.cargo/bin

      # go
      # set -x GOPATH ${config.home.homeDirectory}/devs/_go
      # set -x GOBIN ${config.home.homeDirectory}/devs/_go/bin
      # set -x PATH $PATH $GOPATH/bin

      set -x EDITOR "hx"
      set -x VISUAL "hx"
      set -x GPG_TTY (tty)

      # docker
      set -x DOCKER_BUILDKIT 1
      set -x COMPOSE_DOCKER_CLI_BUILD 1

    '';
  };
}
