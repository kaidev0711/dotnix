{
  pkgs,
  inputs,
  ...
}: {
  programs.fresh-editor = {
    enable = false;
    package = inputs.fresh.packages.${pkgs.system}.default;
    settings = {};
  };
}
