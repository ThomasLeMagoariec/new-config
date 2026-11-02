{ inputs, ... }:
{
	flake.nixosModules.networking = { config, ... }:
	{
		imports = [ inputs.sops-nix.nixosModules.sops ];

		networking = {
			firewall.enable = false;
			networkmanager.enable = true;
		};

		systemd.services.NetworkManager-wait-online.enable = false;

		sops.templates."rene-cassin.nmconnection" = {
			path = "/etc/NetworkManager/system-connections/rene-cassin.nmconnection";
			owner = "root";
			mode = "0600";
			content = ''
				[connection]
				id=Campus Rene Cassin
				uuid=ae0bc87f-a486-4a45-a249-107f1d46403e
				type=wifi
				interface-name=wlp1s0
				permissions=user:thomas:;

				[wifi]
				mode=infrastructure
				ssid=Campus Rene Cassin

				[wifi-security]
				auth-alg=open
				key-mgmt=wpa-eap

				[802-1x]
				eap=peap;
				identity=thomas.lemagoariec
				password=${config.sops.placeholder."school/password"}
				phase2-auth=mschapv2

				[ipv4]
				method=auto

				[ipv6]
				addr-gen-mode=stable-privacy
				method=auto
			'';
		};

		sops.templates."home.nmconnection" = {
			path = "/etc/NetworkManager/system-connections/home.nmconnection";
			owner = "root";
			mode = "0600";
			content = ''
				[connection]
				id=Livebox-8140
				uuid=a2fc393e-be99-4a94-9663-bb83f8cc9a7f
				type=wifi
				interface-name=wlp1s0

				[wifi]
				mode=infrastructure
				ssid=Livebox-8140

				[wifi-security]
				auth-alg=open
				key-mgmt=wpa-psk
				psk=${config.sops.placeholder."home/password"}

				[ipv4]
				method=auto

				[ipv6]
				addr-gen-mode=default
				method=auto
			'';
		};
	};
}
