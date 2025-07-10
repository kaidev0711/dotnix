{ pkgs, ... }:
{
  home.packages = with pkgs; [
    deno
    nodejs_24
    typescript
    pnpm
    yarn
    vscode-langservers-extracted
    tailwindcss_4
    tailwindcss-language-server
  ];
}
