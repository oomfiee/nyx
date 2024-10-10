{pkgs, inputs, config, lib, userSettings, ...}:
{
imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

users.users.${userSettings.username}.extraGroups = [ "minecraft" ];

services.minecraft-servers = {
    enable = true;
    eula = true;

    dataDir = "/var/lib/mixium";

    servers = {
      mixium = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_1.override { loaderVersion = "0.16.5"; };
        openFirewall = true;
        enableReload = true;

        serverProperties = {
          motd = "Minecraft Server Powered Via Nyx:tm:";
          #server-port = 25565;
        };
        whitelist = {/* */};

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
          "world" = ./world;
          "mods" = ./mods;

          # Fetching from the internet
#           "mods" = {
#           AppleSkin = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/EsAfCjCV/versions/fG1xJao0/appleskin-fabric-mc1.21-3.0.5.jar";
#           sha512 = "sha512-MhdjhHefbiI85saL+jxQUiK+DVohYGoZVWK0cdKbL3ryU7tCdW3WY3NHW7dVgvwRxy2L0vMRvQ8K0GgW5PYaKQ==";
#           };
#           Blahaj = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/5bb5rG4b/versions/3rGg0FOJ/blahaj-fabric-1.21-2.0.0.jar";
#           sha512 = "sha512-qdEBO0Wx62PB7TtV1iELwlebff6F99rLl/Tjj3woweeJa6p1XeZcLEEcV1r1D9xsI+p1A89Xd7JwWRxEYjjD6w==";
#           };
#           Comforts = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/SaCpeal4/versions/hDG8neIB/comforts-fabric-9.0.0%2B1.21.jar";
#           sha512 = "sha512-GCZH2T2T0nQ8s+a5Kk34ye73CB3/Y1SRJiFyV+U76MladIhNtNPY8uvPkItjPpfXHKjs7lsDnTisl+4KTSPaWg==";
#           };
#           Wildfires-Female-Gender-Mod = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/bcOsQHnC/versions/kJmjQvAS/Female-Gender-Mod-fabric-3.2.1%2B1.21.jar";
#           sha512 = "sha512-QKI5nYcEz7GsMZVXn610jTEtqZwv2IaxSLA1Yk1X5lrwPgAJ+Ez8Zp9RTF2cE5hScBBakSiTkYseWlqIHC47Xw==";
#           };
#           FallingTree = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/Fb4jn8m6/versions/uni2ZHB8/FallingTree-1.21-1.21.0.7.jar";
#           sha512 = "sha512-Q4I74qboToaT7wo/Miy8cuNbAY3sAxaIvN2pgNx6qeNGKjJHJGRqt/SCDhWU3wMAVRhG6+lGzE0sDBGcOvVyeg==";
#           };
#           Lithium = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/M7RXiitG/lithium-fabric-mc1.21-0.13.1.jar";
#           sha512 = "sha512-xCo4EzmPycuZubj9/Jr4n7zjJFwcXVTNCO3AXlGdPB7hScAPdFo6DrIW89GDbqNbSRD1jmMS6gZeF+V0IoUyFw==";
#           };
#           Vegan-Mob-Drops = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/ZrQkwH6G/versions/DF3HzGOZ/vegan-mob-drops-4.2.jar";
#           sha512 = "sha512-uXGEo99VJqulG5OuyW0ITJ11uAmU4+cKd4oMeD+6m1dxUZPezExU0caLnMRw/GRB5iwfBtZ2a18rF/THdvPEPQ==";
#           };
#           FerriteCore = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/uXXizFIs/versions/wmIZ4wP4/ferritecore-7.0.0-fabric.jar";
#           sha512 = "sha512-Dy+bWuvXHvMGT8lN+WQpasbujqEiIQmLnfA3vcqsp7zNRzyYF5X01X/z1J2j74HxOkJWaIC58R3GRkXpyK1dTw==";
#           };
#           VoiceChat = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/9eGKb6K1/versions/FvsJfBJ0/voicechat-fabric-1.21.1-2.5.23.jar";
#           sha512 = "sha512-BfdYpVr1Ab7IWjdbpVbGuBoWPb7oarRjITVoLSc6R3C9dEiFD9txfXVoGf//PuDTDGsxtpiKbChBX7NlKIV2zQ==";
#           };
#           Text-Placeholder-API = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/eXts2L7r/versions/cE5TczQr/placeholder-api-2.4.1%2B1.21.jar";
#           sha512 = "sha512-D8KxBjJ34crasw/bXxFxy976VR8W422qYR9np3U1PnCkhTgIXivPj8ItZX1FDOdNyKqcz26Lxt5tWoQftG4IKA==";
#           };
#           fabric-api = pkgs.fetchurl {
#           url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/bK6OgzFj/fabric-api-0.102.1%2B1.21.1.jar";
#           sha512 = "sha512-/wWL200whmo0p0rkV9p+mBr/0TDCOIfAyBlMbstQI8yjU917gxMmqzPfXG07v7HQeqcbvXnbswzKVTT9dMX1UQ==";
#           };
#         };
      };
    };
  };
};
}
