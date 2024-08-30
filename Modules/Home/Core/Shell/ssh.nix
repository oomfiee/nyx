{pkgs, config, lib, ...}:
{
  # // Enable SSHFS service //
  services.openssh.allowSFTP = true;
  services.openssh.enable = true;

  systemd.services.autofs.path = [ pkgs.sshfs ];
  services.autofs = {
    enable = true;
    autoMaster = ''
      
    '';
  };
}
