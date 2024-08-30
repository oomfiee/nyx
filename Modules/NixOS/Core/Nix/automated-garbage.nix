{ config, lib, pkgs, inputs, ... }:
{
 # // Automatic garbage collection //
 nix.gc = {
   automatic = true;
   dates = "weekly";
   options = "--delete-older-than 7d";
  };
}
