{ config, lib, pkgs, host, preferences, ... }:
{
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
}
