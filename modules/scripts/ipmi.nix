{ inputs, self, ... }:
{
	flake.nixosModules.ipmi = { ... }: {
		environment.systemPackages = [
			self'.packages.ipmi
		];
	};

	perSystem = { pkgs, ... }: {
		packages.ipmi = pkgs.hello;
	};
}

