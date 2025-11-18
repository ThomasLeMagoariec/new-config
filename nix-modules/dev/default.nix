{ config, lib, pkgs, host, ... }:

{
	imports = [
		./minimal.nix
        ./utilities.nix
        ./git.nix
        ./tools.nix
	];
}

