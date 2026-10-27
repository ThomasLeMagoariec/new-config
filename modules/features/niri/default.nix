{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.nir= moduleWithSystem ({ pkgs, self', ... }: {
		programs.niri = {
			enable = true;
			package = self'.packages.zsh;
		};
	});
	perSystem = { pkgs, lib, ... }: {
		packages.zsh = inputs.wrappers.wrappers.niri.wrap {
			inherit pkgs;
		};
	};
}
