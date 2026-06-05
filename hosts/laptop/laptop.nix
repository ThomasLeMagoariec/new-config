{
    profile = "laptop";
    username = "thomas";
    timeZone = "Europe/Paris";
    hostName = "nixos";
    trustedUsers = [ "root" "username" ];

    features = [
        "openssh"
    ];

    #bluetooth = {
    #    enable = true;
    #    emulateMac = true;
    #};
    

    sshKeys = [
        (builtins.readFile ../../keys/id_key.pub)
        (builtins.readFile ../../keys/id_jean.pub)
    ];
}
