{ config, pkgs, ... }:
{
 boot.kernel = {
 sysctl = {
 "vm.swappiness" = 180;
 "vm.watermark_boost_factor" = 0;
 "vm.watermark_scale_factor" = 125;
 "vm.page-cluster" = 0;
 };
};

#boot.kernelParams = [ "zswap.enabled=1" "zswap.compressor=zstd" ];
}
