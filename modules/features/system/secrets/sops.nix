{
	inputs,
	...
}: {
	flake.nixosModules.sops = { lib, ... }: {
    lib.nixosSystem.modules = [
      inputs.sops-nix.nixosModules.sops
    ];
  };
}