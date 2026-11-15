{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.keykoard = moduleWithSystem ({ self', ... }: { config, ... }:
	{
		environment.systemPackages = [
			pkgs.vial
		];
	});
	
}
