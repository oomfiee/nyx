{ config, lib, pkgs, inputs, ... }:
{
# enable sddm

options = {
    sddm.enable =
      lib.mkEnableOption "enables sddm";
  };

config = lib.mkIf config.sddm.enable {
services = {
  xserver = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    displayManager.sddm.settings = {        # Set sddm settings
      Theme = {
        CursorTheme = "breeze_cursors";
       };
     };
   };
 };
};
}
