{
	inputs,
  ...
}: {
	flake.nixosModules.sops = { pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    environment.systemPackages = with pkgs; [
      age
      sops
	  ];
  };

  flake.homeModules.sops = { pkgs, config, ... }: {
    imports = [
      inputs.sops-nix.homeManagerModules.sops
    ];

    sops.defaultSopsFile = ./secrets.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/home/mika/.config/sops/age/keys.txt";


    sops.secrets."anki/password" = { };
    sops.secrets."anki/email" = { };

    systemd.user.services."testsops" = {
      Unit.Description = "Check SOPS secret files";
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.writeShellScript "testsops" ''
          echo "
          Anki password: ${config.sops.secrets."anki/password".path}
          Anki email: ${config.sops.secrets."anki/email".path}
          " > /home/mika/Downloads/anki-credits.log
        ''}";
      };
    };
  };
}