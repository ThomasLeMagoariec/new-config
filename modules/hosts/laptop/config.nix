{ ... }:
{
	flake.nixosModules.laptopConfig = { pkgs, ... }:
	{
		imports = [
			./_hardware.nix
		];

		environment.systemPackages = with pkgs; [
			git
			vim
		];

		system.stateVersion = "26.05";
	};
}
