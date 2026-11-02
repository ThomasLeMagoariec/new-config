{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.user = moduleWithSystem ({ self', ... }: { config, ... }:
	{
		users.mutableUsers = false;

		users.users.thomas = {
			isNormalUser = true;
			hashedPasswordFile = config.sops.secrets."user/thomas/password".path;
			shell = self'.packages.zsh;
			extraGroups = [
				"root"
				"wheel"
			];
		};
	});
}
