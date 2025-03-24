final: prev: {
  television = prev.rustPlatform.buildRustPackage rec {
    pname = "television";
    version = "0.11.4";

    src = prev.fetchFromGitHub {
      owner = "alexpasmantier";
      repo = "television";
      tag = version;
      hash = "sha256-We8e61gQu7xOdfxI8BVHMyEXVQ83/r/h/olT8193k98=";
    };

    useFetchCargoVendor = true;
    cargoHash = "sha256-5KLsHgPgbly9rAet259NA6k/Iuwa8SucIRUKU+gybiI=";
  };
}
