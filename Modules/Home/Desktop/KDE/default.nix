{ config, lib, pkgs, inputs, ... }:
{

 # Enable the kde plasma desktop environment & sddm
services = {
  xserver.enable = true;
  desktopManager.plasma6.enable = true;
    displayManager.sddm = {
     enable = true;
     wayland.enable = true;
    };
    displayManager.sddm.settings = {        # Set sddm settings
      Theme = {
        CursorTheme = "breeze_cursors";
      };
    };
    #xserver.desktopManager.plasma5.enable = true;
    #displayManager.defaultSession = "plasma";
    };

    environment.systemPackages = [
    (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user"
     "[General]
      type=image
      background=${../../Themes/background.png}
     ")
    ];

    programs.xwayland.enable = true;
}
