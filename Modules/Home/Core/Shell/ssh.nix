{ pkgs, config, lib, ... }:
{
  # // Enable SSHFS service //
  services = {
   openssh = {
      enable = true;
      allowSFTP = true;
      ports = [ 22 ];
      settings = {
        PasswordAuthentication = false;
        AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "no"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };
   autofs = {
      enable = true;
      autoMaster = ''

      '';
    };
 };

  systemd.services.autofs.path = [ pkgs.sshfs ];
}
