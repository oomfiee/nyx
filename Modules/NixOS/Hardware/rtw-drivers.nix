{ config, pkgs, ... }:
{
 hardware.firmware = [ pkgs.rtw88-firmware ];
 boot.extraModulePackages = [ config.boot.kernelPackages.rtw88 ];
}
