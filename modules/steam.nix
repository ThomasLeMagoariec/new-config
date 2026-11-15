{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.steam = moduleWithSystem ({ self', ... }: { config, ... }:
	{
		programs.steam.enable = true;
	});
}
