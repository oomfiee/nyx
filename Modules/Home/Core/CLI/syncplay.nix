{ pkgs, lib, config, ... }:
{

 # syncplay stuff
 services.syncplay = {
   enable = true;
   chat = true;
 };
}
