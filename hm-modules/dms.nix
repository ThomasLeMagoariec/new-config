{ config, lib, dms, inputs, pkgs-unstable, ... }:
{
    imports = [
        inputs.dms.homeModules.dank-material-shell
    ];

    programs.dank-material-shell = {
        enable = true;
        dgop.package = pkgs-unstable.dgop;
    };
}

