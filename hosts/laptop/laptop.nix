{
    profile = "laptop";
    username = "thomas";

    sshKeys = [
        (builtins.readFile ../../keys/id_key.pub)
        (builtins.readFile ../../keys/id_jean.pub)
    ];
}
