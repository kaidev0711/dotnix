{...}: {
  imports = [
    ./activation
  ];
  home.file.".hushlogin".text = "";
  # Swift
  home.file.".sourcekit-lsp/config.json".text = ''
    {
      "backgroundIndexing": true,
      "backgroundPreparationMode": "enabled"
    }
  '';
}
