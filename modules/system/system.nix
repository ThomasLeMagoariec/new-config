{ self, ... }:
{
	flake.nixosModules.system = { ... }:
	let
		modules = with self.nixosModules; [
			bootloader
			networking
			user
		];
	in {
		imports = modules;
	};
}
