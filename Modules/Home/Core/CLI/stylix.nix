{ pkgs, lib, config, stylix, userSettings, inputs, ... }:

let
in
{
    stylix.enable = true;

    stylix.base16Scheme = ../../Themes/tomorrow-night.yaml;
    stylix.image = ../../Themes/background.png;
    stylix.polarity = "dark";
    stylix.autoEnable = true;
    stylix.targets = {
      gtk.enable = true;
      kde.enable = true;
       wezterm.enable = true;
       nushell.enable = true;
       firefox.enable = true;
       hyprland.enable = false;
    };
    stylix.cursor.size = 24;

    stylix.fonts = {
    sizes = {
      applications = 10;
      desktop = 10;
      terminal = 10;
    };
    monospace = {
      name = userSettings.font;
      package = userSettings.fontpkg;
    };

    emoji = {
      name = "Noto Color Emoji";
      package = pkgs.noto-fonts-emoji;
    };


    sansSerif = {
      name = "IBM Plex Sans";
      package = pkgs.ibm-plex;
    };
  };

  stylix.cursor = {
      name = "breeze_cursors";
      package = pkgs.kdePackages.breeze-icons;
  };
}
