{ pkgs, config, lib, ... }:
{
    imports = [
    #./fish.nix
    #./nushell.nix
    ./ssh.nix
    ];
}

