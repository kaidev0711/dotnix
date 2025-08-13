{pkgs, ...}: {
  imports = [
    ./lazydocker
  ];
  home.packages = with pkgs; [
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
    settings = {};
  };
}
