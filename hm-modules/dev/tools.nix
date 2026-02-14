{ pkgs, my-pkgs, ... }:
{

    nixpkgs.overlays = [
        my-pkgs.overlays.default
    ];

    home.packages = with pkgs; [
        qbittorrent
            ipmitool
            lutris
            gemini-cli
            copilot-cli
            ncurses
            man-pages
            just
            jetbrains.idea

            librepods
    ];
}
