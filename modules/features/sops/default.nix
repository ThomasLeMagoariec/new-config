{ inputs, ... }:
{
	flake.nixosModules.sops = { pkgs, ... }: {
		imports = [ inputs.sops-nix.nixosModules.sops ];

		sops = {
			defaultSopsFile = ../../secrets/secrets.yaml;
			age.keyFile = "$HOME/.config/sops/age/keys.txt";
			secrets.user.thomas.password = {
				owner = "thomas";   # default is root
			};
		};

		environment.systemPackages = with pkgs; [ sops age ];
	};
}
