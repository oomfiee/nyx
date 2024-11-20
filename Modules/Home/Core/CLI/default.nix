{ pkgs, config, lib, userSettings, inputs, ... }:
{

   imports = [
    ./flatpak.nix
    ./syncthing.nix
    ./kdeconnect.nix
    #./gpg.nix
    #./git.nix
    #./stylix.nix
    #./fastfetch.nix
    ./containers.nix
    ];
}
