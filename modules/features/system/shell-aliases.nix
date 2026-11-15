{
	...
}: {
	flake.nixosModules.shell-aliases = { pkgs, ... }: {
    environment.shellAliases = {
      nrebuild = "sudo nixos-rebuild --flake ~/.nix-config/#hauptquartier --upgrade";
      hrebuild = "home-manager --flake ~/.nix-config/#mika --upgrade";
      laz = "lazygit";
    };
  };
}
