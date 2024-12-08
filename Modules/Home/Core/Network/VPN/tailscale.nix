{ pkgs, config, lib, ... }:
{

 # Enable Tailscale service.
 services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
};

 environment.systemPackages = with pkgs; [
  #ethtool
  networkd-dispatcher
  tailscale
];

#  services = {
#    networkd-dispatcher = {
#      enable = true;
#      rules."50-tailscale" = {
#        onState = ["routable"];
#        script = ''
#          ${lib.getExe ethtool} -K eth0 rx-udp-gro-forwarding on rx-gro-list off
#        '';
#      };
#    };
#  };

  networking.firewall = {
    # always allow traffic from your Tailscale network
    trustedInterfaces = [ "tailscale0" ];

    # allow the Tailscale UDP port through the firewall
    allowedUDPPorts = [ config.services.tailscale.port ];

    # let you SSH in over the public internet
    # allowedTCPPorts = [ 22 ];
  };
}
