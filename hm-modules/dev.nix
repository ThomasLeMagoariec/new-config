{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    qbittorrent
    ipmitool
    nasm
    xorriso
    grub2
    qemu
    lutris
    steam
  ];
}
