{...}: {
  programs.pay-respects = {
    enable = false;
    enableNushellIntegration = false;
    options = [];
  };
  xdg.configFile."pay-respects/config.toml".text = ''
    # maximum time in milliseconds for getting previous output
    timeout = 3000

    # how suggestions are evaluated after being confirmed
    # options can be:
    # - Internal: commands are evaluated inside `pay-respects`
    # - Shell: current working shell is responsible for execution
    eval_method = "Internal"

    [package_manager]
    # preferred package manager
    package_manager = "nix"

    # preferred installation method, can be limited by the package manager
    # available options are:
    # - System
    # - Shell (nix and guix only)
    install_method = "Shell"
  '';
}
