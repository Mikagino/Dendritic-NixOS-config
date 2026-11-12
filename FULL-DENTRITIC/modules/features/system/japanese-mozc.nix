{
	...
}: {
	flake.nixosModules.japanese-mozc = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      ipafont
      kochi-substitute
    ];

    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [ 
        fcitx5-mozc-ut
        fcitx5-gtk 
      ];
    };
  };
}
