spec:
{config, pkgs, ...}:
let
    areAllString = lst:
         (builtins.all (item: builtins.isString item) lst);

    featureModules = {
        openssh = ../nix-modules/openssh.nix;
    };

    selectedModules = features:
        map (name: featureModules.${name})
      spec.features;

    validateSshKeys = keys:
        if (areAllString keys)
            then keys
        else
            throw "sshKeys must be a list of strings";

    validateTimeZone = zone:
    let
        zoneInfo = "${pkgs.tzdata}/share/zoneinfo/${zone}";
    in 
        if (builtins.pathExists zoneInfo)
            then zone
        else
            builtins.warn "${zone} is not a valid timeZone" "Europe/Paris";

    validateHardwareConfig = profile:
        if (builtins.pathExists ../hosts/${spec.profile}/hardware-configuration.nix)
            then ../hosts/${spec.profile}/hardware-configuration.nix
        else
            throw "'${spec.profile}' is not a valid profile";
        
    validateTrustedUsers = users:
        if (areAllString users)
            then users
        else
            builtins.warn "trustedUsers is not a list of strings defaulting to just root" ["root"];


in {
    imports = [
        (validateHardwareConfig spec.profile)
        ../nix-modules/dev
        ../nix-modules
    ] ++ pkgs.lib.optionals (spec.bluetooth.enable) ../nix-modules/bluetooth.nix;

    
    sops.secrets."${spec.username}/user/password".neededForUsers = spec.sops or true;

    users.mutableUsers = !(spec.sops or true);

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.settings.trusted-users = validateTrustedUsers spec.trustedUsers or [{body = "not valid";}];

    time.timeZone = (validateTimeZone (spec.timeZone or "invalid timeZone"));

    services.displayManager.sessionPackages = [
        pkgs.niri
    ];

    services.xserver.enable = true;

    services.displayManager.sddm = {
        enable = spec.sddm.enable or true;
        wayland.enable = true;
        theme = spec.sddm.theme or "catppuccin-mocha-mauve";
    };

    users.users.${spec.username} = {
        ignoreShellProgramCheck = true;
        shell = pkgs.zsh;
        isNormalUser = true;
        extraGroups = [ "wheel" "sudo" "docker" ];
        hashedPasswordFile = config.sops.secrets."${spec.username}/user/password".path;

        openssh.authorizedKeys.keys = validateSshKeys spec.sshKeys;
    };

    environment.systemPackages = with pkgs; [
        vim
        git
        wget
        (pkgs.catppuccin-sddm.override {
            flavor = "mocha";
            accent = "mauve";
        })
    ];

    system.stateVersion = "26.05"; # Did you read the comment?
}
