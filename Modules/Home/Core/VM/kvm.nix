{ config, lib, pkgs, sources, ... }:
{
    boot.initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];

    boot.kernelParams = [
      # VFIO: AMD Raphael iGPU + HDMI audio (probably redundant)
      # 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA106 [Geforce RTX 3050] [10de:2507] (rev a1)
      # 01:00.1 Audio device [0403]: NVIDIA Corporation GA106 High Definition Audio Controller [10de:228e] (rev a1)
      "vfio-pci.ids=10de:2507,10de:228e"
    ];

    # drop em firmware images in they/them
    systemd.services.libvirtd-config.script = ''
      # symbolic, always file (no stupid disambiguation depending on if name exists), force
      ln -sTf ${./fw} /run/libvirt/ckie-firmware
      ln -sTf ${sources.osx-kvm} /run/libvirt/osx-kvm
      ln -sTf ${pkgs.virtiofsd} /run/libvirt/virtiofsd
    '';

    virtualisation.libvirtd.hooks.qemu."10-vfio-manager" = pkgs.writeShellScript "vfio-qemu-hook" ''
      set -euo pipefail
      # Dynamically VFIO bind/unbind the USB with the VM starting up/stopping
      if [[ "$1" =~ "win10|ventura" ]]; then
        [ "$2" = "prepare" ] && virsh nodedev-reattach pci_0000_13_00_3
        [ "$2" = "release" ] && virsh nodedev-detach pci_0000_13_00_3
      fi
    '';


    # TODO: use HM programs.looking-glass-client.enable:
    environment.systemPackages = with pkgs; [ looking-glass-client ];

    cookie.user.extraGroups = [ "qemu-libvirtd" ];
    systemd.tmpfiles.rules =
      [ "f /dev/shm/looking-glass 0660 root qemu-libvirtd -" ];

    # expose pipewire-pulse
    services.pipewire.extraConfig = {
        pipewire-pulse."30-localhost-net-publish"."pulse.cmd" = [{
          cmd = "load-module";
          args =
            "module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1";
        }];
      };

    home-manager.users.oomfie = { ... }: {
      systemd.user.services.scream = {
        Unit = {
          Description = "Scream VFIO/Pulse/TCP4 lo";
          After = [ "pipewire-pulse.service" "pipewire.service" ];
          PartOf = [ "graphical-session.target" ];
        };

        Install = { WantedBy = [ "graphical-session.target" ]; };

        Service = {
          Type = "simple";
          Restart = "on-failure";
          ExecStart = "${pkgs.scream}/bin/scream";
        };
      };

      programs.looking-glass-client.enable = true;
    };
}
