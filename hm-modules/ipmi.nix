{ pkgs, ... }:

let
    script = ''
        set -e
        ipmitool -I lanplus -H $1 -U root -P calvin raw 0x30 0x30 0x01 0x00
        ipmitool -I lanplus -H $1 -U root -P calvin raw 0x30 0x30 0x02 0xff 0x$(printf "%x" $2)
    '';
in
{
    home.packages = [(
        pkgs.writeShellScriptBin "ipmi" script
    )];
}
