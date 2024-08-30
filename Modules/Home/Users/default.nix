{ pkgs, config, lib, userSettings, ... }:
{

   imports = [
    ( ./. +("/"+userSettings.username))                                               # system configurations
    ./config.nix
  ];

}
