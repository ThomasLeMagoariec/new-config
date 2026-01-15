{ pkgs }:
{
    home.packages = [
        pkgs.callPackage ./librepods {}
    ];
}
