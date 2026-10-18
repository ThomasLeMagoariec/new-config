{ ... }:
{
	flake.nixosModules.laptopConfig = { pkgs, ... }:
	{
		imports = [
			./hardware.nix
		];

		environment.systemPackages = with pkgs; [
			git
		];
	};
}
