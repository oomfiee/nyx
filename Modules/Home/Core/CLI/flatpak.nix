{ pkgs, lib, config, inputs, ... }: {
  system.fsPackages = [ pkgs.bindfs ];
  fileSystems =
    let
      mkRoSymBind = path: {
        device = path;
        fsType = "fuse.bindfs";
        options = [ "ro" "resolve-symlinks" "x-gvfs-hide" ];
      };
      aggregated = pkgs.buildEnv {
        name = "system-fonts-and-icons";
        paths = with pkgs;[
          libsForQt5.breeze-qt5

          noto-fonts
          noto-fonts-emoji
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif
        ];
        pathsToLink = [ "/share/fonts" "/share/icons" ];
      };
    in
    {
      # Create an FHS mount to support flatpak host icons/fonts
      "/usr/share/icons" = mkRoSymBind "${aggregated}/share/icons";
      "/usr/share/fonts" = mkRoSymBind "${aggregated}/share/fonts";
    };


 services.flatpak.enable = true;                          # Enable flatpak service

  services.flatpak.packages = [
    #{ appId = "com.brave.Browser"; origin = "flathub"; }
    #"com.obsproject.Studio"
    "org.jdownloader.JDownloader"
    #"org.kde.kget"
    #"org.inkscape.Inkscape"
    #"com.github.wwmm.easyeffects"
    #"io.github.NhekoReborn.Nheko"
    #"org.keepassxc.KeePassXC"
    #"io.freetubeapp.FreeTube"
  ];
}
