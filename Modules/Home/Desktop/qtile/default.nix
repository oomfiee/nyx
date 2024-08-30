{ config, lib, pkgs, inputs, ... }:
{

# enable qtile
services.xserver.windowManager.qtile = {
  enable = true;
    backend = "wayland";
      extraPackages = python3Packages: with python3Packages; [
        qtile-extras
      ];
   };
}
