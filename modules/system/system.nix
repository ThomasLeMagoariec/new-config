{ self, ... }:
{
	flake.nixosModules.system = { ... }:
	let
		modules = with self.nixosModules; [
			bootloader
			networking
			user
			bluetooth
			sops
			mako
			vpn
		];
	in {
		imports = modules;
    	time.timeZone = "Europe/Paris";
		nix.settings.experimental-features = [ "nix-command" "flakes" ];
	};
}
