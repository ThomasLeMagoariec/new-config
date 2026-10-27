{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.fuzzel = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = with self'.packages; [
			fuzzel
		];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.fuzzel = inputs.wrappers.wrappers.fuzzel.wrap {
			inherit pkgs;
			flags = {
				"--config" = lib.mkForce ./config.ini;
			};
		};
	};
}
