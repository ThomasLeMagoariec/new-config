{ pkgs, inputs, config, lib, ... }: {
    imports = [
        inputs.sops-nix.nixosModules.sops
    ];

    environment.systemPackages = with pkgs; [
        sops
    ];

    sops.defaultSopsFile = ../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/thomas/.config/sops/age/keys.txt";

    #sops.secrets.example_key = {
    #    owner = config.users.users.thomas.name;
    #};

    sops.secrets."private_keys/thomas/ssh" = { };

}
