{
	inputs,
	...
}: {
	flake.nixosModules.sops = { pkgs, ... }: {
    modules = [
      sops-nix.nixosModules.sops
    ];
  };
}