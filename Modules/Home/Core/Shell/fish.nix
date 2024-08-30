{ config, lib, pkgs, inputs, ... }:
{
 # // Enable fish shell //
 programs.fish = {
  enable = true;
  shellInit = ''
   fastfetch
   starship init fish | source
 '';
 functions = {
  fish_greeting = "";
};
shellAliases = {
  apply = "sudo nixos-rebuild switch --flake .#";
  fhome = "sudo rm ~/.gtkrc-2.0";
  rhome = "sudo systemctl restart home-manager-oomfie.service";
  ani = "~/.local/bin/animdl";
  };
 };
}
