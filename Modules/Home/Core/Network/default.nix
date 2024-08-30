{pkgs, config, lib, ...}:
{
    imports = [
    ./DNS
    ./Firewall
    ./Wireless/nm.nix
    ];
}
