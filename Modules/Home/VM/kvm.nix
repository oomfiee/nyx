{ pkgs, config, userSettings, ... }:

let
  # Change this to your username.
  user = "oomfie";
  # Change this to match your system's CPU.
  platform = "intel";
  # Change this to specify the IOMMU ids you wrote down earlier.
  vfioIds = [ "10de:2507" "10de:228e" ];
in {
  # Configure kernel options to make sure IOMMU & KVM support is on.
  boot = {
    kernelModules = [ "kvm-${platform}" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
    kernelParams = [ "${platform}_iommu=on" "${platform}_iommu=pt" "kvm.ignore_msrs=1" ];
    extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";
  };

#   # Add a file for looking-glass to use later. This will allow for viewing the guest VM's screen in a
#   # performant way.
  systemd.tmpfiles.rules = [
      "f /dev/shm/looking-glass 0660 ${user} qemu-libvirtd -"
  ];

  programs.virt-manager.enable = true;
  programs.dconf.enable = true;

  # Add virt-manager and looking-glass to use later.
  environment.systemPackages = with pkgs; [
   #   virt-manager
      looking-glass-client
  ];

  # Enable virtualisation programs. These will be used by virt-manager to run your VM.
  virtualisation = {
     libvirtd = {
       enable = true;

       qemu = {
         package = pkgs.qemu_kvm;
         ovmf.enable = true;
         verbatimConfig = ''
            namespaces = []
           user = "+${builtins.toString config.users.users.${user}.uid}"
         '';
       };
    };
  };

  users.users.${userSettings.username}.extraGroups = [ "qemu-libvirtd" "libvirtd" "disk" ];
}
