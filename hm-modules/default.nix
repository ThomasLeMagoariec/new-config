{ config, lib, pkgs, host, ... }:

{
	imports = [
		./nixvim
        ./zsh.nix
        ./dev.nix
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
        prismlauncher
    ];
}

