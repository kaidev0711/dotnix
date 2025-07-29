{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustup
    rustlings
    workshop-runner
    cargo-nextest
    cargo-audit
    cargo-flamegraph
    cargo-binstall
    cargo-info
    gitoxide
    openssl
    pkg-config
    tokio-console
    wasmtime
    wabt
  ];
}
