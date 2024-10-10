{ pkgs, config, lib, systemSettings, ... }:
{
    imports = [
    ./CLI
    ./Network
    ./Shell
    ./Games
    #./VM
    ];
}
