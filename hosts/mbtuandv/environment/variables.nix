{pkgs, ...}: {
  environment.variables = {
    SHELL = "${pkgs.fish}/bin/fish";
  };
}
