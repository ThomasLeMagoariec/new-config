{ ... }:
{
	flake.nixosModules.system = { pkgs, ... }:
	{
		imports = [
			/home/thomas/downloads_tmp/hardware.nix
		];

		environment.systemPackages = with pkgs; [
			git
		];
	};
}
