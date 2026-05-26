{ spec, ... }:
let
    enableMac = 
        if spec.emulateMac then {hardware.bluetooth.settings.General.DeviceID = "bluetooth:004C:0000:0000"; }
        else {};
in {
    services.blueman.enable = spec.bluetooth.enable;

    hardware.bluetooth.settings = enableMac;

}
