{
  pkgs,
  lib,
  ...
}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "markdown";
          language-servers = ["markdown-oxide" "marksman" "codebook" "typos-lsp"];
          auto-format = true;
          formatter = {
            command = lib.getExe pkgs.deno;
            args = ["fmt" "-" "--ext" "md"];
          };
        }
      ];
      language-server = {
        markdown-oxide = {
          command = lib.getExe pkgs.markdown-oxide;
        };
        marksman = {
          command = lib.getExe pkgs.marksman;
          args = ["server"];
        };
      };
    };
  };
}
