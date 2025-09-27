{pkgs, ...}: {
  home.packages = with pkgs; [
    typos
    typos-lsp
  ];
}
