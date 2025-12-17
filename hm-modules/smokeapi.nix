{ pkgs, config, lib, ... }: {
  home.packages = with pkgs; [
    brotli
    glibc
    libidn2
    libnghttp2
    libssh2
    openssl
    zlib
    zstd
  ];


}
