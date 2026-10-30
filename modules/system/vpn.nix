{ ... }:
{
	flake.nixosModules.vpn = { pkgs, ... }:
	{
		environment.systemPackages = [
			pkgs.wireguard-tools
		];
	};
}
