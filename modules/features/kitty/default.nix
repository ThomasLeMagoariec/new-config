{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.kitty = moduleWithSystem ({ pkgs, self', ... }: {
		programs.kitty = {
			enable = true;
			package = self'.packages.kitty;
		};
	});
	perSystem = { pkgs, lib, ... }: {
		packages.kitty = inputs.wrappers.wrappers.kitty.wrap {
			inherit pkgs;
			themeFile = "Catppuccin-Macchiato";
			font.name = "FiraMono Nerd Font";
		};
	};
}
