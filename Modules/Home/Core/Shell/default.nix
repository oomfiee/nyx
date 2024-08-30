{pkgs, config, lib, ...}:
{
    imports = [
    #./fish.nix
    #./nushell.nix
    ./ssh.nix
    ];

   programs.fish.enable = true;
}

