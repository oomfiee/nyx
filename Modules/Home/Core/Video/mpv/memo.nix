{ pkgs, lib, config, ... }:
{


home.file."${config.xdg.configHome}/mpv/scripts/memo.lua" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/po5/memo/master/memo.lua";
  sha256 = "0hgidy1ph8p6csa3jsldlcg7zyqqkh75af5sb19s69x7vw4z64s5";
 };
};

home.file."${config.xdg.configHome}/mpv/script-opts/memo.conf" = {
  recursive = true;
  source = builtins.fetchurl {
  url = "https://raw.githubusercontent.com/po5/memo/master/memo.conf";
  sha256 = "0vl5s2myb8zw5lvjims2smq2k698z5k4zqlla0za89hwf6fwrfh3";
 };
};
}
