{ pkgs, ... }:
{
    home.packages = [
        (pkgs.callPackage ./librepods/librepods.nix {})
    ];
}
