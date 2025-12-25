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
            sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
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
