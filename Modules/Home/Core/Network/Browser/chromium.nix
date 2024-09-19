{ config, lib, pkgs, inputs, ... }:
{

 programs.chromium = {
  enable = true;
  package = pkgs.ungoogled-chromium;
  extensions = [
    { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
    { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origins
    { id = "kekjfbackdeiabghhcdklcdoekaanoel"; } # MAL-Sync
    { id = "lcbjdhceifofjlpecfpeimnnphbcjgnc"; } # XbrowserSync
  ];
 };
}
