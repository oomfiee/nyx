{ config, lib, pkgs, inputs, ... }:
{

boot = {
  loader = {
    systemd-boot.enable = lib.mkForce true;
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
#   tpm2.enable = true;
#   };
   };
}
