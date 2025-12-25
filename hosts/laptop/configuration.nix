{ config, lib, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../../nix-modules/dev
        ../../nix-modules
    ];

    sops.secrets."thomas/user/password".neededForUsers = true;
    users.mutableUsers = false;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.trusted-users = [ "root" "thomas" ];

    nixpkgs.config.allowUnfree = true;

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Paris";

    services.xserver.enable = true;

    services.displayManager.sddm.enable = true;
    programs.hyprland.enable = true;
    services.desktopManager.gnome.enable = true;

    services.displayManager.sddm = {
        wayland.enable = true;
    };

    users.users.thomas = {
        ignoreShellProgramCheck = true;
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" "sudo" ];
        hashedPasswordFile = config.sops.secrets."thomas/user/password".path;

        openssh.authorizedKeys.keys = [
            (builtins.readFile ../../keys/id_ed25519.pub)
        ];
    };

    environment.systemPackages = with pkgs; [
        vim
        git
        wget
        home-manager
    ];

    system.stateVersion = "25.11"; # Did you read the comment?

}

