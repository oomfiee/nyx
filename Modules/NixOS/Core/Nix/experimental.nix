{ config, lib, pkgs, inputs, ... }:
{
 # // Enable experimental nixos features //
nix.settings.experimental-features = [ "nix-command" "flakes" ];

 # optimise nixos
nix.settings.auto-optimise-store = true;

nix.settings.allowed-users = [ "@wheel" ];
}
