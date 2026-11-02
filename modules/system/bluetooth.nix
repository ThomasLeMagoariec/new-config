{ ... }:
{
	flake.nixosModules.bluetooth = { ... }: {
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
