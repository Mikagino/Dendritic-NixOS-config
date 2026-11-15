{
  inputs,
	...
}: {
  flake.homeModules.anki = { pkgs, config, ... }: {
    # imports = [
    #   inputs.sops-nix.homeManagerModules.sops
    # ];

    sops.secrets."anki/email" = { };
    sops.secrets."anki/password" = { };

    programs.anki = {
      enable = true;
      profiles.Mika = {
        default = true;
        sync = {
          usernameFile = "${config.sops.secrets."anki/email".path}";
          keyFile = "${config.sops.secrets."anki/password".path}";
        };
      };
    };
  };
}
