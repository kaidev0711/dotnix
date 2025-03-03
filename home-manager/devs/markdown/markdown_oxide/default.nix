{ config, ... }:
{
  xdg.configFile."moxide/settings.toml".text = ''
    # Leave blank to try to import from Obsidian Daily Notes
    dailynote = "%Y-%m-%d" # this is akin to YYYY-MM-DD from Obsidian

    # Fuzzy match file headings in completions
    heading_completions = true

    # Set true if you title your notes by the first heading
    # Right now, if true this will cause completing a file link in the markdown style
    # to insert the name of the first heading in the display text area
    # [](file) -> [first heading of file.md](file)
    # If false, [](file) -> [](file) (for example)
    title_headings = true

    # Show diagnostics for unresolved links; note that even if this is turned off, 
    # special semantic tokens will be sent for the unresolved links, allowing you
    # to visually identify unresolved links
    unresolved_diagnostics = true

    semantic_tokens = true

    # Resolve tags in code blocks
    tags_in_codeblocks = true
    # Resolve references in code blocks
    references_in_codeblocks = true

    # The folder for new files to be created in; this is relevant for the code action that creates
    # from an unresolved link. If not specified, it will import from your obsidian config option titled
    # "Default Location for new notes" -- which is "" by default too. 
    new_file_folder_path = "${config.home.homeDirectory}/Notes"


    # The folder for new daily notes: this is applied for the create file for unresolved link code action
    # as well as the Today, Tomorrow, Yesterday, and Daily... lsp commands
    #
    # This is also imported from obsidian if not specified: specifically the option titled "New file location"
    daily_notes_folder = "${config.home.homeDirectory}/Notes/daily"


    # Whether markdown links should include an extension or not
    # for example [File](file.md) or [File](file)
    include_md_extension_md_link = false

    # Whether wikilinks should include an extension or not (needed for Markor compatibility)
    # for example [[File]] or [[File.md]]
    include_md_extension_wikilink = false

    # Enable hover; this is relevant for VSCode and Zed where hover could be triggered on mouse hover
    # and could be annoying
    hover = true

    # Handle case in fuzzy matches: Ignore | Smart | Respect
    case_matching = "Smart"

    # Enable inlay hints
    inlay_hints = true
    # Enable transclusion, in the form of inlay hints, for embedded block links: ![[link]]
    # Inlay hints must be enabled
    block_transclusion = true
    # Full or Partial, for Partial, block_transclusion_length = { partial = 10 }
    # block_transclusion must be enabled for this to take effect
    block_transclusion_length = "Full"
  '';
}
