{pkgs, config, lib, systemSettings, ...}:
{

  # // Switch to xanmod kernel linuxKernel.packages.linux_xanmod_latest //
boot.kernelPackages = systemSettings.kernel;

   # // Earlyoom prevents systems from locking up when they run out of memory //
services.earlyoom.enable = false;
   
   # // FIXME: WARNING SYSTEMD-OOMD HAS BUGS UNKNOWN WHEN ITS FIXED //
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

}

