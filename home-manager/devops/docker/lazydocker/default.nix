{...}: {
  programs.lazydocker = {
    enable = true;
    settings = {
      commandTemplates = {
        dockerCompose = "docker compose";
      };
    };
  };
}
