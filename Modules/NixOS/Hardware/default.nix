{pkgs, config, lib, systemSettings, ...}:
{
    imports = [
        ./keyboard.nix                                           # Keyboard layouts
        ./printing.nix                                           # Print drivers
        #./drive.nix                                             # HDD & SDD drives 
        ./firmware.nix                                           # Firmware support
        #./rtw-drivers.nix
        ( ./. +("/"+systemSettings.swap)+".nix")
    ];
}
