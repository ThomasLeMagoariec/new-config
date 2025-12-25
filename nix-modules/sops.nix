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
            sshKeyPaths = [ "/home/thomas/.ssh/id_ed25519" ];
            keyFile = "/var/lib/sops-nix/key.txt";
            generateKey = true;
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
