{ inputs, ... }:
{
    home.packages = [
        inputs.nixmate.packages.x86_64-linux.default
    ];
}
