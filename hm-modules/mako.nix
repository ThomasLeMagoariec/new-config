{ pkgs, lib, ... }: {

  imports = [
    ./pkgs/opt-mako.nix
  ];

  home.packages = with pkgs; [
    libnotify
  ];

  services.mako.enable = true;

  home.activation.reloadMako = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  if command -v makoctl >/dev/null 2>&1; then
      echo "Reloading mako..."
      makoctl reload || true
  fi
  '';

  programs.mako = {
    enable = true;
    defaultTimeout = 5000;
    font = "monospace 16";
    backgroundColor = "#2d2d2d";
    borderColor = "#000000";
    borderRadius = 10;
  };

}
