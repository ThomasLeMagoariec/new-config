{ inputs, ...}: {
    imports = [
        inputs.sops-nix.homeManagerModules.sops
    ];

    sops = {
        age.keyFile = "/home/thomas/.config/sops/age/keys.txt";

        defaultSopsFile = ../secrets/secrets.yaml;
        validateSopsFile = false;

        secrets = {
            "thomas/private_keys/ssh" = {
                path = "/home/thomas/.ssh/id_key";
            };
        };
    };
}
