{ pkgs, inputs, config, ... }:
let
    prefs = import ../prefs.nix;
in
{
    imports = [
        inputs.sops-nix.nixosModules.sops
    ];

    environment.systemPackages = with pkgs; [
        sops
    ];

    sops = {
        defaultSopsFile = ../secrets/secrets.yaml;
        defaultSopsFormat = "yaml";

        age = {
            keyFile = "/home/" + prefs.username + "/.config/sops/age/keys.txt";
        };

        secrets = {
            "${prefs.username}/private_keys/ssh" = {
                owner = config.users.users.${prefs.username}.name;
            };
            "${prefs.username}/user/password" = {
                owner = config.users.users.${prefs.username}.name;
            };
            "${prefs.username}/private_keys/yubi" = {
                owner = config.users.users.${prefs.username}.name;
                path = "/home/${prefs.username}/.ssh/id_jean";
            };
            "${prefs.username}/private_keys/u2f" = {
                owner = config.users.users.${prefs.username}.name;
                path = "/home/${prefs.username}/.config/Yubico/u2f_keys";
            };
        };
    };

}
