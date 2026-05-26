{ spec, lib, ...}:
let
    validateHostName = host:
        if (lib.and (builtins.isString host) (host != "no host name set"))
            then host
        else
            builtins.warn "'${toString host}' is invalid defaulting to 'nixos'" "nixos";
in {
    networking.hostName = validateHostName (spec.hostName or "no host name set");
    networking.networkmanager.enable = true;
}
