{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Dang Van Tuan";
    userEmail = "kaiz.developers@gmail.com";
    ignores = [
      ".DS_Store"
      ".jj"
    ];
    lfs = {
      enable = true;
    };
    # signing = {
    #   signByDefault = true;
    # };

    # home.file.".ssh/allowed_signers".text = "* ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILxWe2rXKoiO6W14LYPVfJKzRfJ1f3Jhzxrgjc/D4tU7";

    extraConfig = {
      core = {
        pager = "delta";
        editor = "hx";
      };
      interactive.diffFilter = "delta --color-only";
      merge.conflictStyle = "zdiff3";
      delta = {
        navigate = true;
        side-by-side = true;
        line-numbers = true;
      };

      # gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingKey = "~/.ssh/id_ed25519";
      commit.gpgSign = true;
      gpg.format = "ssh";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      color = {
        ui = true;
      };
      # credential.helper = "store";
      # fetch.prune = true;
    };
  };
}
