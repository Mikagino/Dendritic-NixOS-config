{
	...
}: {
  flake.homeModules.office = { pkgs, ... }: {
    home.packages = with pkgs; [
      # ----- Libre Office -----
      libreoffice-qt
      hunspell
      hunspellDicts.uk_UA
      hunspellDicts.en_US
      hunspellDicts.de_DE

      # ----- Others -----
      obsidian
      xournalpp
    ];
  };
}
