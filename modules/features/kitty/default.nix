{ inputs, moduleWithSystem, lib, ... }:
{
	flake.nixosModules.kitty = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [
			self'.packages.kitty
		];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.kitty = inputs.wrappers.wrappers.kitty.wrap {
			inherit pkgs;
			themeFile = "Catppuccin-Macchiato";
			font.name = "FiraMono Nerd Font";
			flags = {
				"--title" = "kitty";
			};
		};
	};
}
