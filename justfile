rebuild_all: rebuild_nix rebuild_home

rebuild_nix:
    sudo nixos-rebuild switch --flake .#laptop --show-trace

rebuild_home:
    home-manager switch --flake .#thomas --show-trace

rebuild_cool:
    home-manager switch --flake .#thomas &> log &
    cbonsai -li
    
