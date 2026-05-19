{ pkgs, pkgs-unstable, ... }: {

    environment.systemPackages =
        (with pkgs; [
            quarkus
            docker
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
        ]);

  programs.nix-ld.enable = true;

  virtualisation.docker = {
      enable = true;
  };

  users.users.thomas.extraGroups = [ "docker" ];


}
