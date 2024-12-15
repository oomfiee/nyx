{pkgs, inputs, config, lib, userSettings, flux, ...}:
{
imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

users.users.${userSettings.username}.extraGroups = [ "minecraft" ];

services.minecraft-servers = {
    enable = true;
    eula = true;

    dataDir = "/var/lib/minecraft";

    servers = {
      mx = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_4.override {
          #loaderVersion = "0.16.7";
          #jre_headless = pkgs.temurin-jre-bin-21;
        };
        openFirewall = true;
        enableReload = true;

        serverProperties = {
          motd = "Silly Server For friens and such! [MS CORP IS NOT ALLOWED]";
          server-port = 25565;
          log-ips = false;
          enforce-secure-profiles = false;
        };
        whitelist = {/* */};

        #jvmOpts = "-Xms18432M -Xmx18432M -XX:+UseZGC -XX:+ZGenerational";

        symlinks =
        let
#           modpack = (pkgs.fetchPackwizModpack {
#             url = “https://github.com/Misterio77/Modpack/raw/0.2.9/pack.toml”;
#             packHash = “sha256-L5RiSktqtSQBDecVfGj1iDaXV+E90zrNEcf4jtsg+wk=”;
#           })
        in {
          # Modpack example
          # “mods” = ”${modpack}/mods”;

          # Directories
          #"world" = ./world;
          #"mods" = ./mods;

          "server-icon.png" = ./server-icon.png;

          # Fetching from the internet
#           mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
#             MixinConflictHelper = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/MR1VIQJJ/versions/8dRAFcey/MixinConflictHelper-1.2.0.jar";
#             sha256 = "sha256-TWM30iINbCZYE1LyWitO68Bxe9NzH7zRhl4id97mBLo=";
#             };
# #             bettercombat = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/5sy6g3kz/versions/qxfX3jsR/bettercombat-fabric-1.8.6%2B1.20.1.jar";
# #             sha256 = "sha256-9CB8QuoLiA2hDgrXff1h2e7uoVT8RsMTMNxZXaHhdt4=";
# #             };
#             ferritecore = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uXXizFIs/versions/unerR5MN/ferritecore-6.0.1-fabric.jar";
#             sha256 = "sha256-x7oRGKBbLakA0cNp++EBej4+w8r+XlE5i4USebm+zyQ=";
#             };
#             krypton = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/jiDwS0W1/krypton-0.2.3.jar";
#             sha256 = "sha256-aa0YECBs4SGBsbCDZA8ETn4lB4HDbJbGVerDYgkFdpg=";
#             };
#             lithium = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/ZSNsJrPI/lithium-fabric-mc1.20.1-0.11.2.jar";
#             sha256 = "sha256-oMWVNV1oDgyHv46uuv7f9pANTncajWiU7m0tQ3Tejfk=";
#             };
#             chunky = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fALzjamp/versions/NHWYq9at/Chunky-1.3.146.jar";
#             sha256 = "sha256-rn+501o6nZ1PIQSurnsxqQHF5YQokeLt2d3MQsJkajg=";
#             };
#             chunkyborder = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/s86X568j/versions/74w5ono0/ChunkyBorder-1.1.53.jar";
#             sha256 = "sha256-gugJX8t90qIIlvq/Nj1IOdIM0WSquMJNYYET6eIQn1U=";
#             };
#             ccapi = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/9s6osm5g/versions/2xQdCMyG/cloth-config-11.1.136-fabric.jar";
#             sha256 = "sha256-hE9JwznI8xROFnqyG30AWfDVcQVOJihaB0k0jaJcSfo=";
#             };
#             fabapi = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/P7uGFii0/fabric-api-0.92.2%2B1.20.1.jar";
#             sha256 = "sha256-RQD4RMRVc9A51o05Y8mIWqnedxJnAhbgrT5d8WxncPw=";
#             };
#             ybd = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/o1C1Dkj5/versions/nidyvq2m/YungsBetterDungeons-1.20-Fabric-4.0.4.jar";
#             sha256 = "sha256-bGn9AxbESM+ccLctvqQkqFvogfmtw+elbo8LCONhH/8=";
#             };
#             ye = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ZYgyPyfq/versions/pfVTUz1L/YungsExtras-1.20-Fabric-4.0.3.jar";
#             sha256 = "sha256-F2XQiF6OvlMK6B8rKuPW2TyEK7BOA7294A8rRckYyXo=";
#             };
#             ybm = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/HjmxVlSr/versions/qLnQnqXS/YungsBetterMineshafts-1.20-Fabric-4.0.4.jar";
#             sha256 = "sha256-CkZXaJIXM5ofYHmi2d2gP20BvqysWcFOCT3tM1fbK4Y=";
#             };
#             ybdt = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/XNlO7sBv/versions/1Z9HNWpj/YungsBetterDesertTemples-1.20-Fabric-3.0.3.jar";
#             sha256 = "sha256-eQ4xwqGRlLgcoNwTRpSlufk1xcGcUKrc+0+QphPBm/8=";
#             };
#             ybom = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/3dT9sgt4/versions/4c00pjbt/YungsBetterOceanMonuments-1.20-Fabric-3.0.4.jar";
#             sha256 = "sha256-MBNIS87uclQKHrdtQDoMNtsP1tmaHhtaOYs3ylDyf7I=";
#             };
#             yb = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Ht4BfYp6/versions/hvfjXu8d/YungsBridges-1.20-Fabric-4.0.3.jar";
#             sha256 = "sha256-mkVIcn/SL9Bu+lpwtL2gIxJJvhB6pbkazGFZgdVY67A=";
#             };
#             yapi = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Ua7DFN59/versions/lscV1N5k/YungsApi-1.20-Fabric-4.0.6.jar";
#             sha256 = "sha256-Jrbcgfh2qr89U+rVnlkIqLD1Q01GwVDP03bAJ6xUBT4=";
#             };
#             ybs = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/kidLKymU/versions/yV6hn0bB/YungsBetterStrongholds-1.20-Fabric-4.0.3.jar";
#             sha256 = "sha256-Eit01ZYpv3VWYyY6TOQ+WKXRO3Tme+ozLUSpvttRt0o=";
#             };
#             ybwh = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/t5FRdP87/versions/lYpHN3iF/YungsBetterWitchHuts-1.20-Fabric-3.0.3.jar";
#             sha256 = "sha256-ehoivpUDu3VW6G60RxpQrNYY/IhZDVQWTTWZyf26lOg=";
#             };
#             ybnf = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Z2mXHnxP/versions/FL88RLRu/YungsBetterNetherFortresses-1.20-Fabric-2.0.6.jar";
#             sha256 = "sha256-k+DlN/zyCxjA6jQObU8sICJaKcRSUrnPeOIFEHq08Do=";
#             };
#             ybnt = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/z9Ve58Ih/versions/6LPrzuB0/YungsBetterJungleTemples-1.20-Fabric-2.0.5.jar";
#             sha256 = "sha256-RL7iDn9RLYRobsU2rI3WvQeBG45k0A6kjEcMk91eKeg=";
#             };
#             ybei = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/2BwBOmBQ/versions/qJTsmyiE/YungsBetterEndIsland-1.20-Fabric-2.0.6.jar";
#             sha256 = "sha256-jmGDo4DBdnfSPV13kNBL8YWJ7RKGdGDs4yMn6HZQRvo=";
#             };
# #             nethermap = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fdtm99de/versions/w97ixzc7/nethermap-3.0.0-1.20.1.jar";
# #             sha256 = "sha256-2ivOs5Xxyl9tQ1Vj/2NHOshIsbYvVizye5tMonCAJCs=";
# #             };
#             treeharvester = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/abooMhox/versions/eeRIweZ0/treeharvester-1.20.1-9.1.jar";
#             sha256 = "sha256-1nVch4clnSfbYyprpkzOmzQ15LDh+S+5RNobmagxLxA=";
#             };
#             plasmovoice = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/1bZhdhsH/versions/9ha1XP2j/plasmovoice-fabric-1.20.1-2.1.1.jar";
#             sha256 = "sha256-wq5PSK1+oc6M6f+wkJ7J3zrh1zDfCCthBwjMS8L2DXk=";
#             };
#             collective = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/e0M1UDsY/versions/aNzU64AT/collective-1.20.1-7.87.jar";
#             sha256 = "sha256-VwIjJoCPMc57qx5MFp27/sMggVyawQ0KykDxdLWmmfM=";
#             };
#             pv-addon-groups = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/g2HFPeCl/versions/UrbDrJ9B/pv-addon-groups-1.1.0.jar";
#             sha256 = "sha256-gKonbs0+ppSegQzOBanJ50KXO3hQFGwgLbShI5fdf0Y=";
#             };
#             pv-addon-sculk = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/7dI2zrDy/versions/HmseAzbt/pv-addon-sculk-1.1.0.jar";
#             sha256 = "sha256-bjwZXJdr4p0g436j6Ny0iTQsgT6E6cNWGznP4KVDIo8=";
#             };
#             pv-addon-broadcast = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ZI9h3Y7k/versions/RNSzWpVe/pv-addon-broadcast-1.1.0.jar";
#             sha256 = "sha256-PE45WC17cjYSmpzKQkEtX679G6VPLmN+0QJ8B5HzHQg=";
#             };
#             pv-addon-spectator = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/bZwNKr3n/versions/ugWqtFbc/pv-addon-spectator-1.1.0.jar";
#             sha256 = "sha256-ZHA+/D6FIakV/R6EDlIoUvFarMrK8gL8d8fAIpxkb9o=";
#             };
#             pv-addon-whisper = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/pZxauj81/versions/ZgizC1Oe/pv-addon-whisper-1.1.0.jar";
#             sha256 = "sha256-Asim/kQNojegS6G7SMYbCzZGUPdvNY0AvneMRZUbYAI=";
#             };
#             pv-addon-priority = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/DoKOaUOC/versions/xPHUGv4E/pv-addon-priority-1.1.0.jar";
#             sha256 = "sha256-OL3l6ocXJlnm3CRv0mbsWTzKIMMDN5HpamJM+BgUfG8=";
#             };
#             pv-addon-lavaplayer-lib = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Kx9d4acU/versions/9mqvAql8/pv-addon-lavaplayer-lib-1.1.0.jar";
#             sha256 = "sha256-4Ot+Akw0DM++6eVIs8MzLxSp/mZIngPWeV1KQro8XkA=";
#             };
#             spark = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/l6YH9Als/versions/XGW2fviP/spark-1.10.53-fabric.jar";
#             sha256 = "sha256-AMA05oT6RHG0FTncKajTnMbyLrKbL6QjiV78l4o5HS0=";
#             };
#             sleep = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/WTzuSu8P/versions/R5tblQON/sleep-v.2.1.2.jar";
#             sha256 = "sha256-9ykEnw0qtvhfkHpD299KHEKCjvLRJaJ95Y9rShRQl1c=";
#             };
#             tcdcommons-api = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/Eldc1g37/versions/2mfYVOhd/tcdcommons-3.9.7%2Bfabric-1.20.1.jar";
#             sha256 = "sha256-fOGKYmcY/9BI6CPmECOMzV7DqXUQiY+//vBMtOxHpYI=";
#             };
# #             rei = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/nfn13YXA/versions/Lg9Hl5NP/RoughlyEnoughItems-12.1.780-fabric.jar";
# #             sha256 = "sha256-PjTDlAkj324GBWlYqDTnGkdJrurfTktMEPGQD+Svolc=";
# #             };
#             terralith = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/8oi3bsk5/versions/YFeeBgIL/Terralith_1.20_v2.5.4.zip";
#             sha256 = "sha256-9oItTcUMfo5NPcCncAxiOm3pqd9yOhtsIwdaWy34YMw=";
#             };
#             player-animation-lib = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/gedNE4y2/versions/yDqYTUaf/player-animation-lib-fabric-1.0.2-rc1%2B1.20.jar";
#             sha256 = "sha256-CxACH6Y4mXOYEQd3dHcmsct6J7w/j/GxLiuTrAF4QBg=";
#             };
#             emi = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/fRiHVvU7/versions/L452maHz/emi-1.1.16%2B1.20.1%2Bfabric.jar";
#             sha256 = "sha256-yJ6uB5xPiI0OIsIUjrTFFDYSfK3XbHWSLxuAs35yNhQ=";
#             };
#             gauntlets = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/daIJrdNd/versions/w7gNtOs3/gauntlets-1.0.0.jar";
#             sha256 = "sha256-yrOiVbf/KD8CPTauMNEg5r4OBAdej8665Ctbju/jj1Q=";
#             };
#             addadd = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/R4TvILfj/versions/1ljqbdZZ/AdditionalAdditions-6.0.1.jar";
#             sha256 = "sha256-4S1WwlTyUqQpQ8MlEZHj89cRjseNEkTOy/BK8zySu28=";
#             };
#             morevanillashields = pkgs.fetchurl { url = "https://mediafilez.forgecdn.net/files/5841/255/morevanillashields-1.0.5-1.20.1.jar";
#             sha256 = "sha256-EbFe+9S11E+kohMjYlNdjBtnW7nGOnB5Lm9stPxGiLQ=";
#             };
#             simplyswords = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/bK3Ubu9p/versions/xe5E39uw/simplyswords-fabric-1.56.0-1.20.1.jar";
#             sha256 = "sha256-3br4q4WmsAOoF9DA6Bfcvfn8/muInHKf9yxLajsfPpo=";
#             };
#             architectury = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/lhGA9TYQ/versions/WbL7MStR/architectury-9.2.14-fabric.jar";
#             sha256 = "sha256-vXpwMr7bL/lsaZGoRqRMhXM2pRRCoQX1hZAX6LqdEyE=";
#             };
#             wthit = pkgs.fetchurl { url = "https://mediafilez.forgecdn.net/files/5721/800/wthit-fabric-8.15.2.jar";
#             sha256 = "sha256-UmiT6uXRN65uQVz8OfWnOI7d4QNUYah05F7NsB02HCk=";
#             };
#             badpackets = pkgs.fetchurl { url = "https://mediafilez.forgecdn.net/files/4784/394/badpackets-fabric-0.4.3.jar";
#             sha256 = "sha256-SmuEziDXo10X74b+KUF95vJXBPR47i9fksfC7nbqiZ4=";
#             };
#             reputation = pkgs.fetchurl { url = "https://mediafilez.forgecdn.net/files/4594/936/your-reputation-0.2.4%2Bwthit.1.20.jar";
#             sha256 = "sha256-zGmr3hYc80TAjdl8yHXNYY20qCRopgPqp9lapcSrVeM=";
#             };
#             alloy-forgery = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/jhl28YkY/versions/j3GoCoCc/alloy-forgery-2.1.2%2B1.20.jar";
#             sha256 = "sha256-6ujgZRPEWPirqDlhiAeKIuLGXxIo9I9SiNF1VDlRhmY=";
#             };
#             mythicmetals = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/bAWzYNRd/versions/usAeRRkO/mythicmetals-0.19.9%2B1.20.1.jar";
#             sha256 = "sha256-OLGfB3LG6CJbgXFGcBqPyBQAp3sNXNjxlD6IpYBDjec=";
#             };
#             basic_fluid_hopper = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/P5cDzldd/versions/pb2kE9LA/basic_fluid_hopper-fabric-0.4.0-1.20.1.jar";
#             sha256 = "sha256-Vqg+gToU6PSl15e0S56kkn+FjA9NLF2BVIMp3fcS2y0=";
#             };
#             largefluidtank = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/uMlJQMHT/versions/llOBsGfb/largefluidtank-fabric-20.7.5.jar";
#             sha256 = "sha256-kXXP75LMBs2epoYzskRQtYGxAfBFCddaj8OG8sG9X2o=";
#             };
#             YetAnotherConfigLib = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/1eAoo2KR/versions/nYfjbBJd/YetAnotherConfigLib-3.6.1%2B1.20.1-fabric.jar";
#             sha256 = "sha256-pKmEPHKEYkOgbnKWHwMOMWfQmX8Y6uo6FIL4TO3m8kU=";
#             };
#             fluidlogged = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/BnXpPaut/versions/BQ0t7nK0/fluidlogged-2.0.1-beta.2-fabric-mc1.20.1.jar";
#             sha256 = "sha256-VuF3PVcYjRTU9JfZh16yLFIOIJlEKDicJ1PkmlwVKvE=";
#             };
# #             owo-lib = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/ccKDOlHs/versions/zyOBB7J4/owo-lib-0.11.2%2B1.20.jar";
# #             sha256 = "sha256-HCScMNPlC7pcs14MOs6/S9X5ab0zQC3i86amGf1ojRI=";
# #             };
#             scalablecatsforce = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/zr0QMQMo/versions/hFiNqs6b/scalable-cats-force-fabric-3.1.2.jar";
#             sha256 = "sha256-MoU61/KWLwas6eAmElZ67WMgHkUqCuLzh3YL1bJ/CHU=";
#             };
# #             harvestwithease = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/W4Ajthd2/versions/F0rAkd7c/harvest-with-ease-fabric-1.20.1-9.2.0.jar";
# #             sha256 = "sha256-dSjk58el51klnU6hfPGIqJbTrQzFE9GrPdzpLea21tQ=";
# #             };
#             veganrecipes = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/LlKsFkYG/versions/OeKZ7GLp/All%20Vegan%20Recipes%20v1.3%20%281.20-1.21.2%29.zip";
#             sha256 = "sha256-FCNN7ljVaAL0K60U8hAbKfAnEiiBqAmt69t7jm7Ltm8=";
#             };
#             farmersdelight = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/7vxePowz/versions/NoioB3or/FarmersDelight-1.20.1-2.1.6%2Brefabricated.jar";
#             sha256 = "sha256-OaHLQTB16OM8c4Sd1o7ytY+N/dTlWtzcnxNBnc6B5tw=";
#             };
#             moredelight = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/znHQQtuU/versions/zst5fZig/moredelight-24.09.27-1.20-fabric.jar";
#             sha256 = "sha256-eWcvzPAo76fTm/A8WTqKpkvUvj03+hwn03TPi2IPk7U=";
#             };
#             Vegandelight = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/vtNhfMsL/versions/NtTxqoSb/VeganDelightFabric-1.1.0.jar";
#             sha256 = "sha256-EOijCuqqWNT44g8TTvtcvbP6p98Xc7psMmJTY9Yq6K4=";
#             };
#             forge-config-api = pkgs.fetchurl { url = "https://modrinth.com/mod/forge-config-api-port/version/v8.0.0-1.20.1-Fabric";
#             sha256 = "sha256-I9sbpmWwaXoeugONZ8yt3S8ca6IIn+QV98+Oqx74TRo=";
#             };
#             essential = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/k2ZPuTBm/versions/dpx10jgF/essential_1-3-4-3_forge_1-20-1.jar";
#             sha256 = "sha256-U8W3XT35h7v1/7jj4a674E4QqsfkQHPvHkV7gYiAuNI=";
#             };
#             cobweb = pkgs.fetchurl { url = "https://cdn.modrinth.com/data/dQcfqGbl/versions/AyWecby3/cobweb-fabric-1.20.1-1.0.0.jar";
#             sha256 = "sha256-zdMRaZwBOmlP93xZk3P6zzc/ZeCkxMYwE7at02lXlu0=";
#             };
#           });
        };
      };
    };
  };
}
