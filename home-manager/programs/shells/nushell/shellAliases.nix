{
  pkgs,
  config,
  ...
}: {
  programs.nushell = {
    shellAliases = {
      cp = "cp -i";
      rm = "rm -i";
      mv = "mv -i";
      ip = "ipconfig getifaddr en0";
      rmds = "fd -H '^\.DS_Store$' -tf -X rm -i";
      # gt = "${pkgs.gitui}/bin/gitui";
      lg = "${pkgs.lazygit}/bin/lazygit";
      zjr = "${pkgs.zellij}/bin/zellij action new-tab -l ${config.xdg.configHome}/zellij/layouts/rust.kdl";
      zjv = "${pkgs.zellij}/bin/zellij action new-tab -l ${config.xdg.configHome}/zellij/layouts/vibes.kdl";
      vibes = "rustyvibes ${config.home.homeDirectory}/devs/_opensource/Soundpacks/nk-cream/ -v 100";
    };
  };
}
