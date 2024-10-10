{ pkgs, modulesPath, lib, config, ... }:

{
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-plasma6.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  # Enable the Plasma 5 Desktop Environment.

  environment.systemPackages = with pkgs; [
    firefox
    bcachefs-tools
    gparted
    parted
    git
    disko

    # Calamares for graphical installation
    #libsForQt5.kpmcore
    #calamares-nixos
    #calamares-nixos-autostart
    #calamares-nixos-extensions
    # Get list of locales
    glibcLocales
  ];


  # Support choosing from any locale
  i18n.supportedLocales = [ "all" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.displayManager = {
    # Automatically login as nixos.
      sddm.enable = true;
      #autoLogin = {
      #  enable = true;
      #  user = "nixos";
      #};
    };


  boot.kernelPackages = lib.mkOverride 0 pkgs.linuxPackages;
  nixpkgs.config.allowUnfree = true;
  boot.supportedFilesystems.zfs = lib.mkForce false;

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.open = true;
}
