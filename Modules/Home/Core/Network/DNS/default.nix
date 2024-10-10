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
#
#   services.adguardhome = {
#     enable = true;
#     settings = {
#       http = {
#         # You can select any ip and port, just make sure to open firewalls where needed
#         address = "127.0.0.1:3003";
#       };
#       dns = {
#         upstream_dns = [
#           # Example config with quad9
#           "9.9.9.9"
#           "149.112.112.112"
#           # Uncomment the following to use a local DNS service (e.g. Unbound)
#           # Additionally replace the address & port as needed
#           # "127.0.0.1:5335"
#         ];
#       };
#       filtering = {
#         protection_enabled = true;
#         filtering_enabled = true;
#
#         parental_enabled = false;  # Parental control-based DNS requests filtering.
#         safe_search = {
#           enabled = false;  # Enforcing "Safe search" option for search engines, when possible.
#         };
#       };
#       # The following notation uses map
#       # to not have to manually create {enabled = true; url = "";} for every filter
#       # This is, however, fully optional
#       filters = map(url: { enabled = true; url = url; }) [
#         "https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt"  # The Big List of Hacked Malware Web Sites
#         "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt"  # malicious url blocklist
#         "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock-mining.txt?_=rawlist"
#         "https://raw.githubusercontent.com/hagezi/dns-blocklists/refs/heads/main/adblock/pro.mini.txt"
#         "https://raw.githubusercontent.com/yokoffing/filterlists/refs/heads/main/annoyance_list.txt"
#       ];
#     };
#   };
}
