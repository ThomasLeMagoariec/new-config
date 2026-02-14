{ inputs, ...}: 
let
    prefs = import ../prefs.nix;
in
{
    imports = [
        inputs.sops-nix.homeManagerModules.sops
    ];

    sops = {
        age.keyFile = "/home/${prefs.username}/.config/sops/age/keys.txt";

        defaultSopsFile = ../secrets/secrets.yaml;

        secrets = {
            "${prefs.username}/private_keys/ssh" = {
                path = "/home/${prefs.username}/.ssh/id_key";
            };
        };
    };

    home.file.".ssh/id_key.pub".source = ../keys/id_key.pub;
}
