{
	inputs,
	self,
	...
}: {
	flake.nixosModules.mika = { pkgs, ... }: {
		users.users.mika = {
			isNormalUser = true;
			description = "Mika";
			extraGroups = [
				"networkmanager"
				"wheel"
			];
		};

	};

	# Select home features for user
	flake.homeConfigurations.mika =
		inputs.home-manager.lib.homeManagerConfiguration {
		pkgs = import inputs.nixpkgs {system = "x86_64-linux";};
		modules = with self.homeModules; [
			audio-editing
			common
			draw
			electronics
			game-dev
			gaming
			git
			kitty
			messengers
			mika
			office
        	nix-config
			print3d
			terminal
        	unstable-overlay
		];
	};

	# Setup home manager
	flake.homeModules.mika = { pkgs, ... }: {
		programs.home-manager.enable = true;

		xdg = {
			enable = true;
			mime.enable = true;
		};

		home = {
			username = "mika";
  			homeDirectory = "/home/mika";
			stateVersion = "26.05";

			packages = with pkgs; [
				kitty
				lazygit
				spotify
			];
		};
	};
}
