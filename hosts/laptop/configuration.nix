{ config, pkgs, ... }:
let
    prefs = import ../../prefs.nix;
in
{
    imports = [
        ./hardware-configuration.nix
        ../../nix-modules/dev
        ../../nix-modules
    ];

    sops.secrets."${prefs.username}/user/password".neededForUsers = true;
    users.mutableUsers = false;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.trusted-users = [ "root" "${prefs.username}" ];

    #nixpkgs.config.allowUnfree = true;

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Paris";

    services.displayManager.sessionPackages = [
        pkgs.niri
    ];

    services.xserver.enable = true;

    #services.desktopManager.gnome.enable = true;

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha-mauve";
    };

    users.users.${prefs.username} = {
        ignoreShellProgramCheck = true;
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" "sudo" "docker" ];
        hashedPasswordFile = config.sops.secrets."${prefs.username}/user/password".path;

        openssh.authorizedKeys.keys = [
            (builtins.readFile ../../keys/id_jean.pub)
            (builtins.readFile ../../keys/id_key.pub)
        ];
    };

    environment.systemPackages = with pkgs; [
        vim
        git
        wget
        home-manager
        (pkgs.catppuccin-sddm.override {
            flavor = "mocha";
            accent = "mauve";
        })
    ];

    system.stateVersion = "25.11"; # Did you read the comment?

}

