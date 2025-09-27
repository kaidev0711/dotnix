{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    targets = {
      bat.enable = true;
      gitui.enable = true;
      yazi.enable = true;
      tmux.enable = true;
      fish.enable = true;
      nushell.enable = true;
      alacritty.enable = true;
      wezterm.enable = true;
      rio.enable = true;
      k9s.enable = true;
      kubecolor.enable = true;
      zellij.enable = true;
      fzf.enable = true;
    };
  };
}
