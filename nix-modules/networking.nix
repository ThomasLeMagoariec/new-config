{ spec, ...}:
let
    validateHostName = host:
        if (builtins.isString host)
            then host
        else
            builtins.warn "'${toString host}' is invalid defaulting to 'nixos'" "nixos";
in {
    networking.hostName = validateHostName spec.hostName;
    networking.networkmanager.enable = true;
}
