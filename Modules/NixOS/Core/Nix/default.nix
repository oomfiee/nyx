{pkgs, config, lib, ...}:
{
    imports = [
    ./automated-garbage.nix
    ./experimental.nix
    ./nix-auto.nix
    ./security.nix
    ];
}
