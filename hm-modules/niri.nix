{ pkgs, config, lib, ... }: {

    imports = [
        ./pkgs/opt-niri.nix
    ];

    programs.niri = {
        enable = true;
        idleTimeout = 300;
    };

    home.packages = with pkgs; [
        niri
        alacritty
        fuzzel
        xwayland-satellite
    ];

    home.file = {
        ".config/niri/config.kdl".source = ../dotfiles/niri.kdl;
    };

}
