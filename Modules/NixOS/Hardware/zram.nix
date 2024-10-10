{ pkgs, config, lib, ... }:
with pkgs;
with lib;
with builtins;
let
in {

 # // Enable Zram Service(?) //
zramSwap = {
     enable = true;
     algorithm = "zstd";
     memoryPercent = 150;
  };
services.zram-generator.enable = true;
 boot.kernel = {
 sysctl = {
 "vm.swappiness" = lib.mkForce 180;
 "vm.watermark_boost_factor" = 0;
 "vm.watermark_scale_factor" = 125;
 "vm.page-cluster" = 0;
 };
};
}
