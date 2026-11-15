{
	inputs,
  ...
}: {
	flake.nixosModules.sops = { pkgs, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    environment.systemPackages = with pkgs; [
      sops
		];

    sops.defaultSopsFile = "./secrets.yaml";
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "~/.config/sops/age/keys.txt";

    sops.secrets."github/email" = { };
    sops.secrets."github/password" = { };
  };
}