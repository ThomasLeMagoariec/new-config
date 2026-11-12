{ inputs, moduleWithSystem, ... }:
{
	flake.nixosModules.docker = moduleWithSystem ({ self', ... }: { config, ... }:
	{
		virtualisation.docker = {
			enable = true;
		};
		users.users.thomas.extraGroups = [ "docker" ];

	});
}
