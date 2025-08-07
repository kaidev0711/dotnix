{pkgs, ...}: {
  home.packages = with pkgs; [
    gopls
    golangci-lint-langserver
    golangci-lint
    gotools
    delve
  ];
  programs.go = {
    enable = true;
    goPath = "go";
    extraGoPaths = [
      "Devs/_go"
    ];
    goBin = "go/bin";
    goPrivate = [];
  };
}
