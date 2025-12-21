{ config, lib, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../nix-modules/dev
        ../../nix-modules
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nixpkgs.config.allowUnfree = true;

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Paris";

    services.xserver.enable = true;

    services.displayManager.sddm.enable = true;
    programs.hyprland.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    services.displayManager.sddm = {
        wayland.enable = true;
    };


    users.users.thomas = {
        ignoreShellProgramCheck = true;
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" "sudo" ];
    };

    environment.systemPackages = with pkgs; [
        vim
        git
        wget
        home-manager
    ];

    system.stateVersion = "25.05"; # Did you read the comment?

}

