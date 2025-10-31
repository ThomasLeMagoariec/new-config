{ config, lib, pkgs, host, ... }:

{
	imports = [
		./minimal.nix
        ./vpn.nix
        ./utilities.nix
	];
}

