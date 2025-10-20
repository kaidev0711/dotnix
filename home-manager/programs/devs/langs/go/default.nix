{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    golangci-lint
    gopls
    golangci-lint-langserver
    gotools
    delve
  ];
  programs.go = {
    enable = true;
    env = {
      GOPATH = [
        "${config.home.homeDirectory}/devs/_go"
      ];
      GOBIN = "${config.home.homeDirectory}/devs/_go/bin";
      GOPRIVATE = [];
    };
  };
}
