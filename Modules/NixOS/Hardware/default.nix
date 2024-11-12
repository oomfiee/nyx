{ pkgs, config, lib, systemSettings, ... }:
{
    imports = [
        ./keyboard.nix                                           # Keyboard layouts
        ./printing.nix                                           # Print drivers
        ./firmware.nix                                           # Firmware support
        #./rtw-drivers.nix
        ./tpm.nix
        ( ./. +("/"+systemSettings.swap)+".nix")
    ];
}
