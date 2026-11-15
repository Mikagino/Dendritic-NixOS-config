{
  inputs,
	...
}: {
  flake.homeModules.anki = { pkgs, config, ... }: {
    sops.secrets."anki/email" = { };
    sops.secrets."anki/password" = { };

    programs.anki = {
      enable = true;
      profiles.Mika = {
        default = true;
        sync = {
          autoSync = true;
          username = config.sops.secrets."anki/password";
        };
      };
    };
  };
}
