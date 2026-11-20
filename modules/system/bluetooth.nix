{ ... }:
{
	flake.nixosModules.bluetooth = { pkgs, ... }: {
		environment.systemPackages = with pkgs; [ blueman ];
		hardware.bluetooth = {
			enable = true;
			settings = {
				General = {
					DeviceID = "bluetooth:004C:0000:0000";
				};
			};
		};
	};
}
