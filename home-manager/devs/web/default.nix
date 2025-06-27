{ pkgs, ... }:
{
  home.packages = with pkgs; [
    deno
    nodejs_24
    typescript
    pnpm
    yarn
  ];
}
