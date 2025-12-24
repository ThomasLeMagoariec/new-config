{ pkgs, inputs, config, lib, ... }: {
    imports = [
        inputs.sops-nix.nixosModules.sops;
    ];

    home.packages = with pkgs; [
        sops
    ];

    sops.defaultSopsFile = ./secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/thomas/.config/sops/age/keys.txt";

}
