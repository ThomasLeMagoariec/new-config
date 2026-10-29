{ inputs, moduleWithSystem, lib, ... }:
{
	flake.nixosModules.quickshell = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [
			self'.packages.quickshell
		];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.quickshell = inputs.wrappers.wrappers.quickshell.wrap {
			inherit pkgs;
			configDir = ./qs;
		};
	};
}
