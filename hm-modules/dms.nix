{ config, lib, pkgs-unstable, dms, inputs, ... }:
{
    imports = [
        inputs.dms.homeModules.dank-material-shell
    ];

    programs.dank-material-shell.enable = true;
}

