{ ... }:
{
	flake.nixosModules.vpn = { pkgs, ... }:
	{
		environment.systemPackages = [
			pkgs.wireguard-tools
			pkgs.strongswan
			pkgs.openssl
		];

		networking.wg-quick.interfaces.home-vpn = {
			configFile = "/etc/wireguard/home-vpn.conf";
			autostart = false;
		};

		services.strongswan-swanctl.enable = true;

		services.strongswan-swanctl.swanctl = {

			connections = {
				banquise = {
					children = {
						banquise = {
							remote_ts = [ "10.0.0.0/9" ];
						};
					};
					local = {
						banquise.auth = "pubkey";
						banquise.certs = [ "thomas.le-magoariec.pem" ];
						banquise.id = "CN=thomas.le-magoariec, O=LaBanquise, C=FR";
					};
					remote = {
						banquise.auth = "pubkey";
						banquise.id = "proxy1.la-banquise.fr";
					};
					remote_addrs = [ "89.168.61.117" ];
					vips = [ "0.0.0.0" ];
				};
			};
		};
	};
}
