{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Đặng Văn Tuấn";
    userEmail = "kaiz.developers@gmail.com";
    ignores = [
      ".DS_Store"
      ".jj"
    ];
    lfs = {
      enable = true;
    };
    extraConfig = {
      core = {
        pager = "delta";
        editor = "hx";
      };
      interactive.diffFilter = "delta --color-only";
      merge.conflictStyle = "zdiff3";
      user.signingKey = "~/.ssh/id_ed25519";
      commit.gpgSign = true;
      gpg.format = "ssh";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      rerere = {
        enabled = true;
      };
      color = {
        ui = true;
      };
    };
    aliases = {
      br = "branch";
      co = "checkout";
      st = "status";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
      cm = "commit -m";
      ca = "commit -am";
      dc = "diff --cached";
      amend = "commit --amend -m";

      update = "submodule update --init --recursive";
      foreach = "submodule foreach";
    };
  };
}
