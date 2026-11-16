{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.steam = moduleWithSystem ({ self', ... }: { lib, ... }:
	{

		nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
			"steam"
		];
		nixpkgs.config.allowUnfree = true;
		programs.steam.enable = true;
	});
}
