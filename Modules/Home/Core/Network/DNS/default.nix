{ config, lib, pkgs, inputs, ... }:
{
# // Add your dns IPs here //
networking = {
      nameservers = [ "193.110.81.0" "185.253.5.0" ];
#      enableIPv6 = true;
};

#services.resolved.extraConfig = ''
#     DNSOverTLS=yes
#  '';
}
