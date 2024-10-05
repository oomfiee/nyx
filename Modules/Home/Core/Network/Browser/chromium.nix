{ config, lib, pkgs, inputs, ... }:
{

 programs.chromium = {
  enable = true;
  package = pkgs.ungoogled-chromium;
  extensions =
  let
    createChromiumExtensionFor = browserVersion: { id, sha256, version }:
      {
        inherit id;
        crxPath = builtins.fetchurl {
          url = "https://clients2.google.com/service/update2/crx?response=redirect&acceptformat=crx2,crx3&prodversion=${browserVersion}&x=id%3D${id}%26installsource%3Dondemand%26uc";
          name = "${id}.crx";
          inherit sha256;
        };
        inherit version;
      };
    createChromiumExtension = createChromiumExtensionFor (lib.versions.major pkgs.ungoogled-chromium.version);
  in
  [
    (createChromiumExtension {
      # ublock origin
      id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
      sha256 = "sha256:1h7hkch680kp40mrc1121l8rl1qxwplqwbl53ysy5kbp9jn77v1r";
      version = "1.60.0";
    })
    (createChromiumExtension {
      # dark reader
      id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
      sha256 = "sha256:0169harv9niwsjhi8pn3p063k1yhnlgjspih6gcfa6wxil50djzp";
      version = "4.9.95";
    })
    (createChromiumExtension {
      # xbrowsersync
      id = "lcbjdhceifofjlpecfpeimnnphbcjgnc";
      sha256 = "sha256:0nzpkmgvi5sx1ph2z6q1dq0hvhikpynjxqh4c2l9xv2lzmz2iwpd";
      version = "1.5.2";
    })
    (createChromiumExtension {
      # xbrowsersync
      id = "kekjfbackdeiabghhcdklcdoekaanoel";
      sha256 = "sha256:167j5sq5rxh904nd6nhsmk6gkp08ii898jhwk5s9fb1ff63qaskp";
      version = "0.10.4";
    })
  ];
  commandLineArgs = [
   "--enable-features=AllowQt"
   "--enable-features=WebUIDarkMode"
   "--force-dark-mode"
   "--disable-features=CustomizeChromeSidePanel"
  ];
 };
}
