{ config, lib, pkgs, inputs, ... }:
{
# // Add your dns IPs here //
networking = {
      nameservers = [ "9.9.9.9" "149.112.112.112" ];
#      enableIPv6 = true;
};

services.resolved.extraConfig = ''
    DNSOverTLS=yes
 '';
}
