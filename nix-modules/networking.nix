{ spec, ...}:
{
    networking.hostName = spec.hostName or "nixos";
    networking.networkmanager.enable = true;
}
