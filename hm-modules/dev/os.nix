{ pkgs, ... }:
{
    home.packages = with pkgs; [
        xorriso
        grub2
        qemu
    ];
}
