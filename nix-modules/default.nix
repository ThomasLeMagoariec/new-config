{ config, lib, pkgs, host, ... }:

{
	imports = [
        ./kb.nix
        ./bluetooth.nix
	];

    nixpkgs.config.allowUnfree = true;
}

