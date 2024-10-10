{ pkgs, config, lib, userSettings, ... }:
{


 # // Enable Syncthing //
services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    systemService = true;
    user    = userSettings.username;
    group   = "wheel";
    dataDir = "/home/${userSettings.username}/syncthing";
  };
}
