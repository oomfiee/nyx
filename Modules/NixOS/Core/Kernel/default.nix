{ pkgs, config, lib, systemSettings, ... }:
{

#imports = [ ./selinux.nix ];

  # // Switch to xanmod kernel linuxKernel.packages.linux_xanmod_latest //
boot.kernelPackages = systemSettings.kernel;

   # // deprceated/unused //
services.earlyoom.enable = false;
   
   # // Default to systemd-oomd killer //
systemd.oomd.enable = true;

    #boot.kernelModules = [ "rtl8821ce" ];
  
   # // Make modules available to modprobe //
   #boot.extraModulePackages = [ config.boot.kernelPackages.rtl8821ce ];

boot.kernel.sysctl."kernel.sysrq" = 1;

security = {
 auditd.enable = true;
  audit = {
   enable = true;
   rules = [
    "-a exit,always -F arch=b64 -S execve"
];
};
};

boot.extraModprobeConfig = ''
 options iwlmvm power_scheme=1
 options iwlwifi power_save=0
 options iwlwifi swcrypto=1
'';

 boot.kernelParams = [
   "pcie_aspm=off"
#   "pcie_aspm.policy=performance"
 ];

}

