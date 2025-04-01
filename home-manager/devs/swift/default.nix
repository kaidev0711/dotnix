{ pkgs, ... }:
{
  home.packages = with pkgs; [
    swift-format
  ];
  home.file.".sourcekit-lsp/config.json".text = ''
    {
      "backgroundIndexing": true,
      "backgroundPreparationMode": "enabled"
    }
  '';
}
