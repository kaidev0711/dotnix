{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./podman
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
