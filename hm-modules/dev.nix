{ pkgs, config, ... }: {

  home.packages = with pkgs; [
    qbittorrent
    ipmitool
    nasm
    xorriso
    grub2
    qemu
    lutris
    gemini-cli
    copilot-cli
    ncurses
    man-pages
  ];
}
