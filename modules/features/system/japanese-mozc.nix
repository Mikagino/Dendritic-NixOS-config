{
	...
}: {
	flake.nixosModules.japanese-mozc = { pkgs, lib, ... }: {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";

      fcitx5 = {
        waylandFrontend = true;

        addons = with pkgs; [ 
          fcitx5-mozc-ut
          fcitx5-gtk
        ];

        settings = {
          globalOptions.Behavior.ActiveByDefault = true;
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "de";
              DefaultIM = "keyboard-de";
            };
            "Groups/1" = {
              Name = "Japanese (mozc)";
              "Default Layout" = "jp";
              DefaultIM = "mozc";
            };
            "Groups/0/Items/0".Name = "keyboard-de";
            "Groups/0/Items/1".Name = "mozc";
          };
        };
      };
    };

    # Disable config qt tool
    nixpkgs.overlays = [
      (final: prev: {
        qt6Packages = prev.qt6Packages.overrideScope (
          qfinal: qprev: {
            fcitx5-with-addons = qprev.fcitx5-with-addons.override {
              withConfigtool = false;
            };
          }
        );
      })
    ];
  };
}
