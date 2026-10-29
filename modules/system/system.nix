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
		];
	in {
		imports = modules;
    	time.timeZone = "Europe/Paris";
		nix.settings.experimental-features = [ "nix-command" "flakes" ];
	};
}
