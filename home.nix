
{ config, pkgs, lib, inputs, systemSettings, userSettings, pkgs-stable, ... }: {

  imports = [
  inputs.arkenfox.hmModules.arkenfox
  ( ./. + "/Modules/Home/" + "/Core/Network/Browser"+("/"+userSettings.browser)+".nix")
  #./Modules/Home/Core/Network/Browser/chromium.nix
  ( ./. + "/Modules/Home/" + "/Core/Video"+("/"+userSettings.video))
  ( ./. + "/Modules/Home/" + "/Core/Shell"+("/"+userSettings.prompt)+".nix")
  ( ./. + "/Modules/Home/" + "/Core/Shell"+("/"+userSettings.sh)+".nix")
  ( ./. + "/Modules/Home/" + "/Core/Term"+("/"+userSettings.term)+".nix") # Broken on Nvidia GPUs
  ( ./. + "/Modules/Home/Core/Network/Email"+("/"+userSettings.email)+".nix")
  ./Modules/Home/Core/CLI/git.nix
  ./Modules/Home/Core/CLI/fastfetch.nix
  ./Modules/Home/Core/CLI/stylix.nix
  #./Modules/Home/Core/CLI/nvim.nix
  #inputs.nixvim.homeManagerModules.nixvim
  inputs.stylix.homeManagerModules.stylix
  ];

  gtk = {
    enable = true;
#     theme = {
#       name = "Breeze";
#       package = pkgs.kdePackages.breeze-gtk;
#     };
    };
  qt.enable = true;

  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.local/cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    configHome = "${config.home.homeDirectory}/.config";
    stateHome = "${config.home.homeDirectory}/.local/state";
    portal.extraPortals = with pkgs; [ xdg-desktop-portal-kde ];
    portal.config.common.default = "kde";
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
      };
    };
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
  };
    stateVersion = "24.11";                                 # Specificify release version
    username = userSettings.username;                       # FIXME: Change 'USERNAME/oomfie' to your username
    homeDirectory = "/home/"+userSettings.username;         # FIXME: Change 'USERNAME/oomfie' to your username
    packages = with pkgs;                                   # List all of your packages here
    [
      onlyoffice-bin
      #simplex-chat-desktop
      #sshfs
      #filezilla
      ripgrep
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
      (inputs.umu.packages.${pkgs.system}.umu.override {version = "${inputs.umu.shortRev}";})
      inputs.lobster.packages.x86_64-linux.lobster
      kdePackages.kate
      android-tools
      wget
      #cups
      imagemagick
      #kde-gtk-config
      #xdg-desktop-portal-kde
      #xdg-desktop-portal
      #bottom
      pinentry-qt
      partition-manager
      #pipx
      #signal-desktop
      trackma-qt
      #qpwgraph
      keepassxc
      nheko
      #kdePackages.neochat
      #thunderbird
      (prismlauncher.override {
        #additionalPrograms = [
        #  glfw
        #];

        jdks = [
          graalvm-ce
          zulu8
          zulu17
          zulu
        ];
      })
      yt-dlp
      wl-clipboard
      #vscodium
      kdePackages.kcolorchooser
      fzf
      #gamescope
      #stremio
      #kdePackages.konversation
      heroic
      #minigalaxy
      #(discord-canary.override {
      #  withVencord = true;
      #  withOpenASAR = true;
      #})
      legcord
      #arrpc
      zola
      #libsForQt5.lightly
      #gparted
      tor-browser-bundle-bin
      (pkgs.uutils-coreutils.override { prefix = ""; })
      #protonvpn-gui
      #ruffle
      #grapejuice
      #gimp
      #doomrunner
      fastfetch
      starship
      sbctl
      #niv
      #yaml-language-server
      #nil
      just
      #freetube
      #dorion
      #atuin
      kdePackages.breeze
      #kdePackages.qt5compat
      #kdePackages.plasma5support
      #steam
      lutris
      protonup-qt
      inkscape
      #protontricks
      #wine64Packages.stable
      wineWowPackages.waylandFull
      nerd-fonts.symbols-only
      #wezterm
    ];
};

home.file."${config.xdg.cacheHome}/flatpak/override/global".text = ''
  [Context]
  filesystems=/run/current-system/sw/share/X11/fonts:ro;/nix/store:ro;xdg-config/gtk-3.0:ro;xdg-config/gtk-4.0:ro;xdg-config/gtkrc:ro
'';


fonts.fontconfig.enable = true;

# home.extraProfileCommands = ''
#   if [[ -d "$out/share/applications" ]] ; then
#     ${pkgs.desktop-file-utils}/bin/update-desktop-database $out/share/applications
#   fi
# '';

systemd.user.startServices = "sd-switch";

# dconf.settings = {
#   "org/virt-manager/virt-manager/connections" = {
#     autoconnect = ["qemu:///system"];
#     uris = ["qemu:///system"];
#   };
# };
}
