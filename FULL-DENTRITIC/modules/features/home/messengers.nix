{
	...
}: {
	flake.homeModules.messengers = {pkgs,  ... }: {
		home.packages = with pkgs; [
			signal-desktop
			whatsapp-electron
			thunderbird
			#discord
			vesktop # alternative discord
      telegram-desktop
			zoom-us
		];
	};
}
