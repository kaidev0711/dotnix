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
            command = lib.getExe pkgs.zig_0_15;
            args = ["fmt" "--stdin"];
          };
        }
      ];
      language-server = {
        zls = {command = lib.getExe pkgs.zls_0_15;};
      };
    };
  };
}
