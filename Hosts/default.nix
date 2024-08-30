{ pkgs, config, lib, ... }:
{

   imports = [    
   ./nyx
   ./roxy
   #./../Modules/NixOS/GPU/intel.nix
  ];
}
