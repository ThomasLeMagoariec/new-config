{ pkgs, ... }:
{
    home.packages = with pkgs; [
        go
        nasm
        cargo
    ];
}
