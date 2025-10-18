{...}: {
  programs.brave = {
    enable = true;
    commandLineArgs = [];
    extensions = [
      {id = "aapbdbdomjkkjkaonfhkkikfgjllcleb";} # Google Translate
      {id = "amfojhdiedpdnlijjbhjnhokbnohfdfb";} # Ejoy
      {id = "bkdgflcldnnnapblkhphbgpggdiikppg";} # DuckDuckGo Search & Tracker Protection
      {id = "mljepckcnbghmcdmaebjhejiplcngbkm";} # Hide Scrollbar
      {id = "bkhaagjahfmjljalopjnoealnfndnagc";} # Octotree
      {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # SponsorBlock
      {id = "dbepggeogbaibhgnhhndojpepiihcmeb";} # Vimium
      {id = "lodbfhdipoipcjmlebjbgmmgekckhpfb";} # Harper
    ];
  };
}
