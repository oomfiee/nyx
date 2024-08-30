{ config, pkgs, systemSettings, userSettings, ...}:
{
  users.users.${userSettings.username} = {
    isNormalUser = true;
    initialPassword = "nixos";
    description = userSettings.username;
    extraGroups = [ "networkmanager" "wheel" "tss" "scanner" "lp" "audio" ];
    shell = pkgs.${userSettings.sh};
   };
}
