{ pkgs, modulesPath, lib, config, ... }:

{
  imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-plasma5.nix" ];

  nixpkgs.hostPlatform = "x86_64-linux";
  # Enable the Plasma 5 Desktop Environment.

  environment.systemPackages = with pkgs; [
    firefox
    bcachefs-tools
    gparted
    parted
    git
    disko
    wezterm
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
      autoLogin = {
        enable = true;
        user = "nixos";
      };
    };


  boot.kernelPackages = lib.mkOverride 0 pkgs.linuxPackages;
  nixpkgs.config.allowUnfree = true;
  boot.supportedFilesystems.zfs = lib.mkForce false;



  # Enable OpenGL
 hardware.graphics = {
   enable = true;
   enable32Bit = true;
   package = config.hardware.nvidia.package;
 };

  # Load "nvidia" driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia-container-toolkit.enable = true;

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = true;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently "beta quality", so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
    "nvidia-drm.modeset=1"
];
}

