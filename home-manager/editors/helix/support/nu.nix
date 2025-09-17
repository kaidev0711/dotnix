{...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "nu";
          language-servers = ["nu-lsp"];
        }
      ];
      language-server = {
        nu-lsp = {
          command = "nu";
          args = ["--lsp"];
        };
      };
    };
  };
}
