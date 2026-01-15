{ pkgs, ... }:
{
    home.packages = [
        (pkgs.callPackage ./librepods/package.nix {})
    ];
}
