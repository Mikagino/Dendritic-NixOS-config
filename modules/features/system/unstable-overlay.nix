{
	inputs,
	...
}: {
	flake.nixosModules.unstable-overlay = { pkgs, ... }: {
    nixpkgs.overlays = [
      (final: _prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (final) system config;
        };
      })
    ];
  };

	flake.homeModules.unstable-overlay = {pkgs, ... }: {
    nixpkgs.overlays = [
      (final: _prev: {
        unstable = import inputs.nixpkgs-unstable {
          inherit (final) system config;
        };
      })
    ];
	};
}

