{ config, lib, pkgs, inputs, ... }:
{

hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      intel-media-driver
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ];
  };
}

