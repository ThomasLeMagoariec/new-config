{ ... }:
{
    imports = [
        ./keybindings.nix
        ./plugins.nix
        ./options.nix
    ];

    programs.nixvim = {
        enable = true;
    };
}
