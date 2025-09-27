{pkgs, ...}: {
  imports = [
    ./system
    ./users
    ./nix
    ./brew
    ./environment
    ./network
    ./programs
    ./fonts
    ./services
    ./activation
  ];
}
