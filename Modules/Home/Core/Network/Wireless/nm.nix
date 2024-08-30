{ config, lib, pkgs, inputs, ... }:
{

  # Enable networking
networking = {
  networkmanager = {
    dns = "none";
      enable = true;
    };
};

systemd.services.NetworkManager-wait-online.enable = false;
}
