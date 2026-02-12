{ inputs, ...}: {
    imports = [
        inputs.sops-nix.homeManagerModules.sops
    ];

    sops = {
        age.keyFile = "/home/thomas/.config/sops/age/keys.txt";

        defaultSopsFile = ../secrets/secrets.yaml;

        secrets = {
            "thomas/private_keys/ssh" = {
                path = "/home/thomas/.ssh/id_key";
            };
        };
    };

    home.file.".ssh/id_key.pub".source = ../keys/id_key.pub;
}
