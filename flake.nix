{
description = "We ball, we are production.";


# nixConfig = {
#
#     # override the default substituters
#     substituters = [
#       # Default NixOS's cache server
#       "https://cache.nixos.org"
#
#       # nix community's cache server
#       "https://nix-community.cachix.org"
#
# #       "https://nyx.chaotic.cx/"
#     ];
#     trusted-public-keys = [
#       # nix community's cache server public key
#       "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
#       "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
# #       "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
#     ];
#     commit-lockfile-summary = "flake.lock: update inputs";
#   };

inputs = {

  # Follow the specified input
  nixpkgs.follows = "nixpkgs-unstable";

  # Nix packages
  nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
  nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

  # Secureboot for nixos (EXPERMENTAL)
#   lanzaboote.url = "github:nix-community/lanzaboote";

  # Home Manager (BASED)
  home-manager = {
    url = "github:nix-community/home-manager/master";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  # Firefox Addons
  firefox-addons = {
    url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    inputs.nixpkgs.follows = "nixpkgs";
};

  # Literally forked it so i can update it faster
  arkenfox = {
    url = "github:oomfiee/arkenfox-nixos";
    inputs.nixpkgs.follows = "nixpkgs";
  };


  # Hmm lobster (Scraper) *Jumpscare of blue lobster*
  lobster.url = "github:justchokingaround/lobster";

  # Powerful Theming Module
  stylix.url = "github:danth/stylix";
  base16.url = "github:SenchoPens/base16.nix";

  #base16-schemes = {
  #  url = "github:tinted-theming/schemes";
  #  url = "github:tinted-theming/base16-schemes";
  #  flake = false;
  #};

  # Someone is going to kill me for making HM manage Flatpak packages
  nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.1.0";

  nixos-generators = {
    url = "github:nix-community/nixos-generators";
    inputs.nixpkgs.follows = "nixpkgs";
  };


  musnix  = {
    url = "github:musnix/musnix";
  };


  # nix replacment
  lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
};


outputs = { self, nixpkgs, nixpkgs-stable, home-manager, arkenfox, lobster, stylix, nix-flatpak, nixos-generators, musnix, lix-module, ... } @ inputs:
  let

    system = "x86_64-linux"; # system arch
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      timezone = "Asia/Riyadh"; # Select Timezone
      locale = "en_US.UTF-8"; # Select Locale
      kernel = pkgs.linuxPackages_latest; # Kernel
      swap = "zram"; # downloadmoreram.com (Legal disclaimer if this domain exists then thats based)
      audio = "pipewire"; # Audio system
      bootloader = "systemd-boot"; # Bootloader
    };

    # ----- USER SETTINGS ----- #
    userSettings = rec {
      username = "oomfie"; # username
      gitname = "oomfie";
      gitemail = "dev.77r2m@simplelogin.co";
      browser = "firefox";
      de = "KDE";
      video = "mpv";
      prompt = "starship";
      sh = "fish";
      term = "wezterm";
      font = "Jetbrains Mono";
      fontpkg = pkgs.jetbrains-mono;
    };

    lib = nixpkgs.lib;

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };

    in {
    nixosConfigurations = {
      rose = lib.nixosSystem {
      system = system;
      specialArgs = {
            # pass config variables from above
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
            inherit pkgs-stable;
          };
        modules = [
        { _module.args = { inherit inputs; }; }
                {
        nixpkgs.config.allowUnfree = true;
        nix.settings.trusted-users = [ userSettings.username ];
        }
        ./Hosts/rose
        ./Modules/NixOS
        ./Modules/Home
        ./Modules/NixOS/Hardware/GPU/nvidia.nix
        nix-flatpak.nixosModules.nix-flatpak
        #lanzaboote.nixosModules.lanzaboote
        home-manager.nixosModules.home-manager
        musnix.nixosModules.musnix
        #stylix.nixosModules.stylix
        lix-module.nixosModules.default
        {
          home-manager = {
          useGlobalPkgs = true;
          extraSpecialArgs = {
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
            inherit pkgs-stable;
          };
          users.${userSettings.username}.imports = [ ./home.nix ];
        };
        }
      ];
    };
  };



 nixosConfigurations = {
      roxy = lib.nixosSystem {
      system = system;
      specialArgs = {
            # pass config variables from above
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
            inherit pkgs-stable;
          };
        modules = [
        { _module.args = { inherit inputs; }; }
                {
        nixpkgs.config.allowUnfree = true;
        nix.settings.trusted-users = [ userSettings.username ];
        }
        ./Hosts/roxy
        ./Modules/NixOS
        ./Modules/Home
        #./Modules/NixOS/Hardware/GPU/nvidia.nix
        nix-flatpak.nixosModules.nix-flatpak
        #lanzaboote.nixosModules.lanzaboote
        home-manager.nixosModules.home-manager
        musnix.nixosModules.musnix
        #stylix.nixosModules.stylix
        {
          home-manager = {
          useGlobalPkgs = true;
          extraSpecialArgs = {
            inherit inputs;
            inherit systemSettings;
            inherit userSettings;
            inherit pkgs-stable;
          };
          users.${userSettings.username}.imports = [ ./home.nix ];
        };
        }
      ];
    };
  };

  iso = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        modules = [
        ./Hosts/isoimage
        ];
        format = "iso";
      };
};
}