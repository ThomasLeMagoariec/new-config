{ config, lib, pkgs, host, ... }:

{
	imports = [
		./nixvim
        ./zsh.nix
        ./dotfiles.nix
        ./hypr.nix
        ./mako.nix
	];

    home.packages = with pkgs; [
        eww
        libnotify
        mako
        pavucontrol
        waylandpp
        wayland
        pkg-config
        meson
        ninja
    ];
}

