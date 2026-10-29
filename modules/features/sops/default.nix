{ inputs, ... }:
{
	flake.nixosModules.sops = { pkgs, lib, ... }:
	let
		hostKeyDir = "/home/thomas/.config/sops/age";
		vmKeyDir = "/var/lib/sops-age";
	in {
		imports = [ inputs.sops-nix.nixosModules.sops ];

		sops = {
			defaultSopsFile = ../../../secrets/secrets.yaml;
			age.keyFile = "${hostKeyDir}/keys.txt";
			secrets."user/thomas/password".neededForUsers = true;
		};

		environment.systemPackages = with pkgs; [ sops age ];

		virtualisation.vmVariant = {
			virtualisation.sharedDirectories.sops-age = {
				source = hostKeyDir;
				target = vmKeyDir;
			};
			sops.age.keyFile = lib.mkForce "${vmKeyDir}/keys.txt";
			environment.variables.SOPS_AGE_KEY_FILE = "${vmKeyDir}/keys.txt";
		};
	};
}
