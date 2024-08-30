{ config, lib, pkgs, inputs, ... }:
{

boot = {
  loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.configurationLimit = 10;
  };
# lanzaboote = {
#   enable = true;
#   pkiBundle = "/etc/secureboot";
# };
#   bootspec.enable = true;
#   initrd.systemd = {
#   enable = true;
#   enableTpm2 = true;
#   };
  };
}
