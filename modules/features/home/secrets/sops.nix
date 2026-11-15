{
	inputs,
	...
}: {
	flake.homeModules.sops = { ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
  };
}