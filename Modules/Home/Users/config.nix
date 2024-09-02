{ config, pkgs, systemSettings, ... }:
{

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
time.timeZone = systemSettings.timezone;
i18n.defaultLocale = systemSettings.locale;
  
system.stateVersion = "24.11"; # Did you read the comment? - no i did not

users.users.root.hashedPassword = "!";
users.users.root.shell = pkgs.shadow; # Disable root login
}
