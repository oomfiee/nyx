{ config, lib, pkgs, inputs, ... }:
{

  # Enable networking
networking = {
  networkmanager = {
    #dns = "none";
      enable = true;
      wifi.powersave = false;
    };
};

#systemd.services.NetworkManager-wait-online.enable = false;
}
