{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.zsh = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = with self'.packages; [
			hyprlock
		];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.fuzzel = inputs.wrappers.wrappers.fuzzel.wrap {
			inherit pkgs;
			settings = {
				include = ./. + "/config.ini";
			};
		};
	};
}
