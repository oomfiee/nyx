{ pkgs, config, lib, ... }:
with pkgs;
with lib;
with builtins;
let
in {

  # // Configure keymap/Layout //
  services.xserver = {
     xkb = {
      layout = "us,ara";
      variant = "";
      options = "grp:alt_shift_toggle";
      };
  };
}
