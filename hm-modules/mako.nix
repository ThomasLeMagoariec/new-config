{ pkgs, config, ... }: {

  imports = [
    ./pkgs/opt-mako.nix
  ];


  programs.mako = {
    enable = true;
    defaultTimeout = 5000;
    font = "monospace 16";
    backgroundColor = "#ff0000";
    borderColor = "#ffffff";
    borderRadius = 15;
  };

}
