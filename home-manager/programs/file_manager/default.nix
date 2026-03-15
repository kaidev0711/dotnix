{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./yazi
    ./broot
    # ./try_rs
  ];
  home.packages = with pkgs; [
    # inputs.try-rs.packages.${pkgs.system}.default
  ];
}
