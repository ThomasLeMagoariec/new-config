{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.noctalia = moduleWithSystem ({ pkgs, self', ... }: {
		environment.systemPackages = [ self'.packages.noctalia ];
	});
	perSystem = { pkgs, lib, ... }: {
		packages.noctalia = inputs.wrappers.wrappers.noctalia-shell.wrap {
			inherit pkgs;
			package = pkgs.noctalia;
		};
	};
}
