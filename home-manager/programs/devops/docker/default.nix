{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./lazydocker
  ];
  home.packages = with pkgs; [
    colima
    docker
    docker-compose
    dive
    skopeo
    ctop
    trippy
  ];
  home.sessionVariables = {
    DOCKER_BUILDKIT = "1";
    COMPOSE_DOCKER_CLI_BUILD = "1";
    # if using Podman set and disable docker-cli
    # DOCKER_HOST = "unix://$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')";

    # With docker
    DOCKER_HOST = "unix://${config.home.homeDirectory}/.config/colima/default/docker.sock";
  };
  programs.docker-cli = {
    enable = true;
    configDir = ".docker";
    settings = {
      auths = {};
      currentContext = "colima";
    };
    contexts = {
      colima = {
        Metadata = {
          Description = "Colima Docker runtime";
        };
        Endpoints = {
          docker = {
            Host = "unix://${config.home.homeDirectory}/.config/colima/default/docker.sock";
          };
        };
      };
    };
  };
}
