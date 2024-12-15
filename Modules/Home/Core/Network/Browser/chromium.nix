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
      sha256 = "sha256:0lj0b5a2vga9x8nr12f9ijv1n0f8zcyzml19bzvw722jb98mic88";
      version = "1.60.0";
    })
    (createChromiumExtension {
      # dark reader
      id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
      sha256 = "sha256:1lih8zbil1jwbzg7m1lnbx41d9smaqbs472lya7dgh36iwgsnpsr";
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
