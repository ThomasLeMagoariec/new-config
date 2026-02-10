{ pkgs, inputs, config, lib, ... }: {
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
            keyFile = "/home/thomas/.config/sops/age/keys.txt";
        };

        secrets = {
            "thomas/private_keys/ssh" = {
                owner = config.users.users.thomas.name;
            };
            "thomas/user/password" = {
                owner = config.users.users.thomas.name;
            };
        };
    };

}
