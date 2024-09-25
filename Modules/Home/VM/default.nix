{pkgs, config, lib, userSettings, ...}:

let

devices = [
  "10de:2507" # Nvidia GPU
  "10de:228e" # Nvidia audio controller
];

in {

programs.dconf.enable = true;

users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];

boot.initrd.kernelModules = [
  "vfio_pci"
  "vfio"
  "vfio_iommu_type1"

  "nvidia"
  "nvidia_modeset"
  "nvidia_uvm"
  "nvidia_drm"
];

virtualisation = {
libvirtd = {
  enable = true;
  qemu = {
    swtpm.enable = true;
    ovmf.enable = true;
    ovmf.packages = [ pkgs.OVMFFull.fd ];
  };
  onBoot = "ignore";
  onShutdown = "shutdown";
};
  spiceUSBRedirection.enable = true;
};

boot.kernelParams = [
#   "intel_iommu=on"
#   "iommu=pt"
  "vfio-pci.ids=${lib.concatStringsSep "," devices}"
];

programs.virt-manager.enable = true;
# https://discourse.nixos.org/t/virt-manager-cannot-find-virtiofsd/26752/2
# add virtiofsd to filesystem xml
# <binary path="/run/current-system/sw/bin/virtiofsd"/>
environment.systemPackages = with pkgs; [
  virtiofsd
  virt-manager
  looking-glass-client
  virt-viewer
  spice spice-gtk
  spice-protocol
  win-virtio
  win-spice
];

systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 ${userSettings.username} libvirtd -"
];
services.spice-vdagentd.enable = true;
}
