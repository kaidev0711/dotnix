{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./kubecolor
    ./k9s
  ];
  home.packages = with pkgs; [
    kubectl
    kubernetes-helm
    kind
    krew
    kustomize
    kuttl
    kluctl
    kubectx
    popeye
    stern
    velero
    argocd
    trivy
  ];
}
