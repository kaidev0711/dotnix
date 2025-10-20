{...}: {
  programs.git = {
    enable = true;
    ignores = [
      ".DS_Store"
      ".jj"
    ];
    lfs = {
      enable = true;
    };
    settings = {
      user = {
        name = "Đặng Văn Tuấn";
        email = "kaiz.developers@gmail.com";
        signingKey = "~/.ssh/id_ed25519";
      };
      core = {
        editor = "hx";
      };
      merge = {};
      commit.gpgSign = true;
      gpg.format = "ssh";
      init.defaultBranch = "main";
      credential.helper = "osxkeychain";
      push.autoSetupRemote = true;
      pull.rebase = true;
      rerere = {
        enabled = true;
      };
      color = {
        ui = true;
      };
      alias = {
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
  };
}
