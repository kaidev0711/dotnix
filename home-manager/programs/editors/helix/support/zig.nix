{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "zig";
          language-servers = ["zls"];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.zig;
            args = ["fmt" "--stdin"];
          };
        }
      ];
      language-server = {
        zls = {command = lib.getExe pkgs.zls;};
      };
    };
  };
}
