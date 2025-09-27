{
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    shellAliases = {
      pipes = "pipes-rs";
      cp = "cp -i";
      rm = "rm -i";
      mv = "mv -i";
      mkdir = "mkdir -p";
      ip = "ipconfi: getifaddr en0";
      rmds = "fd -H '^\.DS_Store$' -tf -X rm -i";
      info = "${pkgs.fastfetch}/bin/fastfetch";
      zjr = "${pkgs.zellij}/bin/zellij action new-tab -l ${config.xdg.configHome}/zellij/layouts/rust.kdl";
      zjv = "${pkgs.zellij}/bin/zellij action new-tab -l ${config.xdg.configHome}/zellij/layouts/vibes.kdl";
      vibes = "rustyvibes ${config.home.homeDirectory}/devs/_opensource/Soundpacks/nk-cream/ -v 100";
      zj = "${pkgs.zellij}/bin/zellij";
      cat = "${pkgs.bat}/bin/bat";
      gt = "${pkgs.gitui}/bin/gitui";
      ju = "${pkgs.just}/bin/just";
      pre = "${pkgs.presenterm}/bin/presenterm";
      top = "${pkgs.bottom}/bin/btm";
      du = "${pkgs.du-dust}/bin/dust";
      epath = ''echo "$PATH" | tr ":" "\n"'';
    };
  };
}
