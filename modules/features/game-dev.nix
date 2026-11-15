{
	inputs,
	...
}: {
	flake.nixosModules.game-dev = { pkgs, ... }: {
		environment.systemPackages = with pkgs; [
      unstable.godot-mono
      godotPackages_4_7.godot-mono
      godotPackages_4_6.godot-mono
			#godot_4_5-mono
			#(blender.withPackages(ps: [ ps.pyserial ps.fs ]))
			inputs.blender-cuda.packages."${stdenv.hostPlatform.system}".default
			inputs.wwise.packages."${stdenv.hostPlatform.system}".wwise_2026_1_3_9276
		];
	};

	# ----- Setup vscode and C# for usage with godot -----
	# https://wiki.nixos.org/wiki/Godot-Mono
	flake.homeModules.game-dev = { pkgs, ... }: {
		programs.vscode = {
      #enable = true;
      mutableExtensionsDir = false;
			profiles.default = {
        userSettings = {
          "dotnetAcquisitionExtension.existingDotnetPath" = [
            {
              "extensionId" = "ms-dotnettools.csharp";
              "path" = "${pkgs.dotnet-sdk_10}/bin/dotnet";
            }
            {
              "extensionId" = "ms-dotnettools.csdevkit";
              "path" = "${pkgs.dotnet-sdk_10}/bin/dotnet";
            }
            {
              "extensionId" = "woberg.godot-dotnet-tools";
              "path" = "${pkgs.dotnet-sdk_8}/bin/dotnet"; # Godot-Mono uses DotNet8 version.
            }
          ];

          "[csharp]" = {
            "editor.defaultFormatter" = "ms-dotnettools.csharp";
            "editor.formatOnSave" = true;
            "editor.formatOnPaste" = true;
          };

          "godotTools.editorPath.godot4" = "godot-mono";
          "godotTools.lsp.serverPort" = 6005; # port should match your Godot configuration
        };

        extensions = with pkgs.vscode-extensions; [
          geequlim.godot-tools # For Godot GDScript support
          woberg.godot-dotnet-tools # For Godot C# support
          ms-dotnettools.csdevkit
          ms-dotnettools.csharp
          ms-dotnettools.vscode-dotnet-runtime
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          { name = "godot-files";
            publisher = "alfish";
            version = "0.1.9";
            sha256 = "sha256:47ebb880d8cbd8583c18ba49d17aba59c0a7b936c8c7d88690a0213ae6314dff";
          }
        ];
      };
		};

		home.packages = with pkgs; [
			dotnetCorePackages.dotnet_9.sdk # For Godot-Mono VSCode-Extension CSharp
		];
	};
}
