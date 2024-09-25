{pkgs, config, lib, systemSettings, ...}:
{

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

# boot.extraModprobeConfig = ''
#  options iwlwifi 11n_disable=1 swcrypto=0 bt_coex_active=0 power_save=0
#  options iwlmvm power_scheme=1
#  options iwlwifi d0i3_disable=1
#  options iwlwifi uapsd_disable=1
#  options iwlwifi lar_disable=1
# '';
#
# boot.kernelParams = [
#   "pcie_port_pm=off"
#   "pcie_aspm.policy=performance"
# ];

}

