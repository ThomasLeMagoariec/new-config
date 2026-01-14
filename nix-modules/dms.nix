{ lib, pkgs-unstable, ... }:
{
    environment.systemPackages = with pkgs-unstable; [
        quickshell
        dms-shell
    ];

}
