{
	inputs,
  ...
}: {
	flake.homeModules.sops = { pkgs, config, users, ... }: {
    imports = [
      # inputs.sops-nix.nixosModules.sops
      inputs.sops-nix.homeManagerModules.sops
    ];

    home.packages = with pkgs; [
      age
      sops
	  ];

    sops.defaultSopsFile = ./secrets.yaml;
    sops.defaultSopsFormat = "yaml";
    sops.age.keyFile = "/home/mika/.config/sops/age/keys.txt";
  };
}