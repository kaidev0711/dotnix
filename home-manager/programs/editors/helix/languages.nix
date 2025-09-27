{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./support
  ];
  programs.helix = {
    languages = {
      language = [
        {
          name = "elixir";
          language-servers = [
            "elixir-ls"
          ];
          auto-format = true;
        }
        {
          name = "heex";
          language-servers = ["elixir-ls" "tailwindcss-ls"];
          auto-format = true;
        }
        {
          name = "eex";
          auto-format = true;
        }
      ];
      language-server = {
        elixir-ls = {
          command = lib.getExe pkgs.beam28Packages.elixir-ls;
          config = {
            elixirLS.dialyzerEnabled = false;
          };
        };
      };
    };
  };
}
