{ pkgs, ... }:
let
    prefs = import ../../prefs.nix;
in
{
  environment.systemPackages = [
    pkgs.strongswan
    pkgs.openssl
  ];

  services.strongswan-swanctl.enable = true;

  services.strongswan-swanctl.swanctl = {
    authorities = {
      banquise1.file = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseRootCA.cacert.pem";
      banquise2.file = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseMachineIssuingCA.cacert.pem";
      banquise3.file = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseMachineSubCA.cacert.pem";
      banquise4.file = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseUserIssuingCA.cacert.pem";
      banquise5.file = "/home/${prefs.username}/.secrets/strongswan/cacerts/BanquiseUserSubCA.cacert.pem";
    };

    connections = {
      banquise = {
        children = {
      banquise = {
        remote_ts = [ "10.0.0.0/9" ];
      };
    };
    local = {
      banquise.auth = "pubkey";
      banquise.certs = [ "/home/${prefs.username}/.secrets/strongswan/x509/thomas.le-magoariec.pem" ];
    };
    remote = {
      banquise.auth = "pubkey";
      banquise.id = "proxy1.la-banquise.fr";
    };
    remote_addrs = [ "89.168.61.117" ];
    vips = [ "0.0.0.0" ];
      };
    };
  };
}
