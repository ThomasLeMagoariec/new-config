{ config, lib, pkgs, host, ... }:

{
	imports = [
        ./kb.nix
        ./bluetooth.nix
	];
}

