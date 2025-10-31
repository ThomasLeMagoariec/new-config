{ config, lib, pkgs, host, ... }:

{
	imports = [
		./nixvim
        ./zsh.nix
        ./dotfiles.nix
        ./hypr.nix
	];

    home.packages = with pkgs; [
        eww
        libnotify
        mako
    ];
}

