{
	...
}: {
	flake.nixosModules.shell-aliases = { pkgs, ... }: {
    environment.shellAliases = {
      nrebuild = "sudo nixos-rebuild --flake ~/.nix-config/#hauptquartier";
      hrebuild = "home-manager --flake ~/.nix-config/#mika";
      laz = "lazygit";
    };
  };
}
