{ inputs, moduleWithSystem, lib, ... }:
{
	flake.nixosModules.waybar = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [
			self'.packages.waybar
		];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.waybar = inputs.wrappers.wrappers.waybar.wrap {
			inherit pkgs;
		};
	};
}
