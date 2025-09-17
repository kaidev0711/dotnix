{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    gopls
    golangci-lint-langserver
    golangci-lint
    gotools
    delve
  ];
  programs.go = {
    enable = true;
    env = {
      GOPATH = [
        "${config.home.homeDirectory}/go"
        "${config.home.homeDirectory}/Devs/_go"
      ];
      GOBIN = "${config.home.homeDirectory}/go/bin";
      GOPRIVATE = [];
    };
  };
}
