{
  inputs,
	...
}: {
	flake.homeModules.git = { pkgs, config, ... }: {
    sops.secrets."github/username" = { };
    sops.secrets."github/email" = { };
    sops.secrets."github/password" = { };

    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "${config.sops.secrets."github/username".path}";
          email = "${config.sops.secrets."github/email".path}";
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
