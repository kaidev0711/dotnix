final: prev: {
  alacritty = prev.alacritty.overrideAttrs (drv: rec {
    version = "0.15.1";
    pname = "alacritty";

    src = prev.fetchFromGitHub {
      owner = "alacritty";
      repo = pname;
      rev = "v0.15.1";
      sha256 = "sha256-/yERMNfCFLPb1S17Y9OacVH8UobDIIZDhM2qPzf5Vds=";
    };

    cargoHash = "";
    postPatch = ''
      cargo update -p alacritty
    '';

  });
}
