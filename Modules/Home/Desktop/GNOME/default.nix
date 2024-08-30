{ config, lib, pkgs, inputs, ... }:
{

# Enable the gnome desktop environment & gdm
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;
}
