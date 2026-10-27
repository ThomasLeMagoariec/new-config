{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.noctalia = moduleWithSystem ({ pkgs, self', ... }: {
		programs.niri = {
			enable = true;
			package = self'.packages.noctalia;
		};
	});
	perSystem = { pkgs, lib, ... }: {
		packages.noctalia = inputs.wrappers.wrappers.noctalia-shell.wrap {
			inherit pkgs;
		};
	};
}
