{ self, ... }:
{
	flake.nixosModules.scripts = { ... }:
	let
		modules = with self.nixosModules; [
			ipmi-tg
		];
	in {
		imports = modules;
	};
}
