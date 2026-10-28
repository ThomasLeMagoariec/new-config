{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.user = moduleWithSystem ({ self', pkgs, ... }:
	{
		users.users.thomas = {
			isNormalUser = true;
			initialPassword = "test";
			shell = self'.packages.zsh;
			extraGroups = [
				"root"
				"wheel"
			];
		};
	});
}
