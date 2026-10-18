{ ... }:
{
	flake.nixosModules.user = { pkgs, ... }:
	{
		users.users.thomas = {
			shell = pkgs.zsh;
			isNormalUser = true;
			initialPassword = "test";
			extraGroups = [
				"root"
				"wheel"
			];
		};

		programs.zsh.enable = true;
	};
}
