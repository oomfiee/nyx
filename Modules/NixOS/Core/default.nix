{ pkgs, config, lib, systemSettings, ... }:
{
    imports = [
    ( ./. + "/Audio"+("/"+systemSettings.audio)+".nix")
    ( ./. + "/Bootloader"+("/"+systemSettings.bootloader)+".nix")
    ./Kernel
    ./Nix
    #./Displayserver
    ];
}
