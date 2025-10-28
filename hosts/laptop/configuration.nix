{ inputs, config, pkgs, ... }:

{

    imports =
    [
        ./hardware-configuration.nix
        ../../modules/default.nix
    ];


    # Bootloader.
    #boot.loader.systemd-boot.enable = true;
    #boot.loader.efi.canTouchEfiVariables = true;

    # shoud be set in the host/default.nix
    #networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

    hardware.bluetooth.enable = true; # enables support for Bluetooth
    hardware.bluetooth.powerOnBoot = true;

    security.rtkit.enable = true; # no clue what this is so won't touch it


    nix.settings.experimental-features = [ "nix-command" "flakes" ];


    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        home-manager
        pkg-config
        openssl
        autoconf
        automake
        libtool
        gettext
    ];

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    system.stateVersion = "25.05"; # Did you read the comment?

}
