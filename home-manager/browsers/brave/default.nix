{...}: {
  programs.brave = {
    enable = true;
    commandLineArgs = [];
    extensions = [
      {id = "aapbdbdomjkkjkaonfhkkikfgjllcleb";} # Google Translate
      {id = "amfojhdiedpdnlijjbhjnhokbnohfdfb";} # Ejoy
      {id = "bkdgflcldnnnapblkhphbgpggdiikppg";} # DuckDuckGo Search & Tracker Protection
      {id = "ddbipglapfjojhfapmpmofnaoellkggc";} # Custom Scrollbars
      {id = "elgmajanahbjpbcljflifdnnmpodfiij";} # Medium Parser
      {id = "bkhaagjahfmjljalopjnoealnfndnagc";} # Octotree
      {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # SponsorBlock
      {id = "dbepggeogbaibhgnhhndojpepiihcmeb";} # Vimium
    ];
  };
}
