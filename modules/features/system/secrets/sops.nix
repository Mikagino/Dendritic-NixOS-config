{
	inputs,
	...
}: {
	flake.nixosModules.sops = { ... }: {
    modules = [
      inputs.sops-nix.nixosModules.sops
    ];
  };
}