{ config, lib, pkgs, host, ... }:

{
	imports = [
		./minimal.nix
        ./vpn.nix
        ./git.nix
        ./tools.nix
        ./tailscale.nix
	];
}

