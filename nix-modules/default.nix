{ config, lib, pkgs, host, ... }:

{
	imports = [
        ./kb.nix
        ./bluetooth.nix
        ./sops.nix
	];

    nixpkgs.config.allowUnfree = true;
}

