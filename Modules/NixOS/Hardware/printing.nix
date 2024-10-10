{ pkgs, config, lib, ... }:
with pkgs;
with lib;
with builtins;
let
in {
  services.ipp-usb.enable = true;                          # Enable cups & hp drivers
    services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
};
   hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
    brscan4.enable = true;
};

services.avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
};
}
