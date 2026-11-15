{
	inputs,
  ...
}: {
	flake.nixosModules.sops = { pkgs, user, ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    environment.systemPackages = with pkgs; [
      sops
	  ];

    sops.defaultSopsFile = ./secrets.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/home/${user.name}/.config/sops/age/keys.txt";
  };
}