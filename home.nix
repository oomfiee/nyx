
{ config, pkgs, lib, inputs, systemSettings, userSettings, pkgs-stable, ... }: {

  imports = [
  inputs.arkenfox.hmModules.arkenfox
  ( ./. + "/Modules/Home/" + "/Core/Network/Browser"+("/"+userSettings.browser)+".nix")
  ( ./. + "/Modules/Home/" + "/Core/Video"+("/"+userSettings.video))
  ( ./. + "/Modules/Home/" + "/Core/Shell"+("/"+userSettings.prompt)+".nix")
  ( ./. + "/Modules/Home/" + "/Core/Shell"+("/"+userSettings.sh)+".nix")
  #( ./. + "/Modules/Home/" + "/Core/Term"+("/"+userSettings.term)+".nix")
  #( ./. + "/Modules/Core/Network/Email"+("/"+userSettings.email)+".nix")
  ./Modules/Home/Core/CLI/git.nix
  ./Modules/Home/Core/CLI/fastfetch.nix
  ./Modules/Home/Core/CLI/stylix.nix
  inputs.stylix.homeManagerModules.stylix
  ];

  gtk.enable = true;
  qt.enable = true;

  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.local/cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    configHome = "${config.home.homeDirectory}/.config";
    stateHome = "${config.home.homeDirectory}/.local/state";
    userDirs = {
      enable      = true;
      createDirectories = true;
      desktop     = "$HOME/Desktop";
      documents   = "$HOME/Documents";
      download    = "$HOME/Downloads";
      music       = "$HOME/Music";
      pictures    = "$HOME/Pictures";
      videos      = "$HOME/Videos";
    };
};

  home = {
    sessionVariables = {
    #MOZ_ENABLE_WAYLAND = "0";
    BROWSER = lib.mkForce "firefox";
  };
    stateVersion = "24.05";                                 # Specificify release version
    username = userSettings.username;                       # FIXME: Change 'USERNAME/oomfie' to your username
    homeDirectory = "/home/"+userSettings.username;         # FIXME: Change 'USERNAME/oomfie' to your username
    packages = with pkgs;                                   # List all of your packages here
    [
      onlyoffice-bin
      ani-cli
      distrobox
      ffmpeg
      fdk_aac
      syncthing
      manrope
      fuse
      #qt5ct
      ark
      #hplip
      kdePackages.kdeconnect-kde
      #inputs.lobster.packages.x86_64-linux.lobster
      kdePackages.kate
      android-tools
      wget
      #cups
      imagemagick
      #kde-gtk-config
      #xdg-desktop-portal-kde
      #bottom
      pinentry-qt
      partition-manager
      #pipx
      #signal-desktop
      #trackma-qt
      #qpwgraph
      keepassxc
      nheko
      #kdePackages.neochat
      #thunderbird
      prismlauncher
      yt-dlp
      wl-clipboard
      #vscodium
      kdePackages.kcolorchooser
      fzf
      #gamescope
      #stremio
      #armcord
      #arrpc
      zola
      #libsForQt5.lightly
      #gparted
      #tor-browser-bundle-bin
      #(pkgs.uutils-coreutils.override { prefix = ""; })
      #protonvpn-gui
      #ruffle
      #grapejuice
      #gimp
      #doomrunner
      fastfetch
      starship
      #sbctl
      #niv
      #yaml-language-server
      #nil
      just
      #freetube
      #dorion
      #atuin
      #kdePackages.breeze
      #kdePackages.qt5compat
      #kdePackages.plasma5support
      #steam
      lutris
      protonup-qt
      inkscape
      wine64Packages.stable
      #wezterm
    ];
};

home.file."${config.xdg.cacheHome}/flatpak/override/global".text = ''
  [Context]
  filesystems=/run/current-system/sw/share/X11/fonts:ro;/nix/store:ro;xdg-config/gtk-3.0:ro;xdg-config/gtk-4.0:ro;xdg-config/gtkrc:ro
'';


fonts.fontconfig.enable = true;

home.extraProfileCommands = ''
  if [[ -d "$out/share/applications" ]] ; then
    ${pkgs.desktop-file-utils}/bin/update-desktop-database $out/share/applications
  fi
'';

systemd.user.startServices = "sd-switch";

}
