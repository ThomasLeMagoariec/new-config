{ ... }:
{
	flake.nixosModules.user = { ... }:
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
