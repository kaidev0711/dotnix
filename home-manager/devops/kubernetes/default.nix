{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./kubecolor
    ./k9s
  ];
  home.sessionVariables = {
    PATH = "${config.home.homeDirectory}/.krew/bin:$PATH";
  };
  home.packages = with pkgs; [
    kubectl
    kubernetes-helm
    kind
    krew
    kustomize
    kuttl
    kluctl
    popeye
    stern
    velero
    argocd
  ];
}
