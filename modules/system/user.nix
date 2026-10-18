{ ... }:
{
	flake.nixosModules.user = { pkgs, ... }:
	{
		users.users.thomas = {
			isNormalUser = true;
			initialPassword = "test";
			extraGroups = [
				"root"
				"wheel"
			];
		};
	};
}
