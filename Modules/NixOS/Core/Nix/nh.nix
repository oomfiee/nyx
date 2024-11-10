{ config, lib, pkgs, inputs, userSettings, ... }:
{

# Install nh and nix-output-monitor
programs.nh = {
    enable = true;
    flake = "/home/${userSettings.username}/nyx";
  };

}
