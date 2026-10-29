{ inputs, moduleWithSystem, lib, ... }:
{
	flake.nixosModules.waybar = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [
			pkgs.waybar
		];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.waybar = inputs.wrappers.wrappers.waybar.wrap {
			inherit pkgs;
		};
	};
}
