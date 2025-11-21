{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    vial
  ];

  services.udev.extraRules = ''
# Vial/VIA keyboards
      SUBSYSTEM=="usb", ATTRS{idVendor}=="feed", MODE="0666"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="feed", MODE="0666"
  '';


}
