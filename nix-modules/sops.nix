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
            "${prefs.username}/banquise/BanquiseMachineIssuingCA"= {
                sopsFile = ../secrets/banquise.yaml;
                key = "BanquiseMachineIssuingCA";
                path = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseMachineIssuingCA.cacert.pem";
                owner = config.users.users.${prefs.username}.name;
            };
            "${prefs.username}/banquise/BanquiseRootCA"= {
                sopsFile = ../secrets/banquise.yaml;
                key = "BanquiseRootCA";
                path = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseRootCA.cacert.pem";
                owner = config.users.users.${prefs.username}.name;
            };
            "${prefs.username}/banquise/BanquiseUserSubCA"= {
                sopsFile = ../secrets/banquise.yaml;
                key = "BanquiseUserSubCA";
                path = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseUserSubCA.cacert.pem";
                owner = config.users.users.${prefs.username}.name;
            };
            "${prefs.username}/banquise/BanquiseMachineSubCA"= {
                sopsFile = ../secrets/banquise.yaml;
                key = "BanquiseMachineSubCA";
                path = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseMachineSubCA.cacert.pem";
                owner = config.users.users.${prefs.username}.name;
            };
            "${prefs.username}/banquise/BanquiseUserIssuingCA"= {
                sopsFile = ../secrets/banquise.yaml;
                key = "BanquiseUserIssuingCA";
                path = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseUserIssuingCA.cacert.pem";
                owner = config.users.users.${prefs.username}.name;
            };
        };
    };

}
