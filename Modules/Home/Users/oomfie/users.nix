{ config, pkgs, systemSettings, userSettings, ... }:
{
  users.users.${userSettings.username} = {
    isNormalUser = true;
    initialPassword = "nixos";
    description = userSettings.username;
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" "audio" "docker" ];
    shell = pkgs.${userSettings.sh};
   };

   programs.fish.enable = true;
}
