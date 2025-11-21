{ pkgs, config, ... }: {

  environment.systemPackages = with pkgs; [
    quarkus
    docker
    maven
    jdk21
    gnumake
    pnpm
    nix-ld
  ];

  programs.nix-ld.enable = true;

  virtualisation.docker = {
      enable = true;
  };

  users.users.thomas.extraGroups = [ "docker" ];

}
