{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./kubecolor
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
    popeye
    stern
    velero
    argocd
  ];
}
