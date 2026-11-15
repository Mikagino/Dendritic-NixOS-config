{
	...
}: {
	flake.homeModules.git = {pkgs, ... }: {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "Mikagino";
          email = "angeli.mika@gmail.com";
        };
        init = {
          defaultBranch = "main";
          safe.directory = "~/.nix-config/";
        };
      };
    };

    programs.lazygit = {
      enable = true;
      settings = {
        notARepository = "skip";
        gui = {
          theme.authorColors."Mikagino" = "#a12929";
          nerdFontsVersion = "3";
          # customIcons = {
          #   extensions = {
          #     ".gd" = {
          #       icon = builtins.fromJSON ''"\ue7ee"'';
          #       color = "#478cbf";
          #     };
          #     ".cs" = {
          #       icon = builtins.fromJSON ''"\udb80\udf1b"'';
          #       color = "#478cbf";
          #     };
          #   };
          # };
        };
      };
    };
	};
}
