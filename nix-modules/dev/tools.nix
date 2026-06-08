{ pkgs, pkgs-unstable, ... }: {

    environment.systemPackages =
        (with pkgs; [
            quarkus
            maven
            jdk21
            gnumake
            pnpm
            SDL2
            wine
        ])
        ++ (with pkgs-unstable; [
            playerctl
            gnumake
            docker
        ]);

  programs.nix-ld.enable = true;

  virtualisation.docker = {
      enable = true;
      package = pkgs.docker_29;
  };

  users.users.thomas.extraGroups = [ "docker" ];


}
