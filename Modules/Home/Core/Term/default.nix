{pkgs, config, lib, userSettings, inputs, ...}:
{

   imports = [
    ( ./. + ("/"+userSettings.term)+".nix")
    ];
}
