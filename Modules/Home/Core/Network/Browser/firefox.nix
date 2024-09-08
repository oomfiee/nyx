{ config, lib, pkgs, inputs, ... }:
{

programs.firefox = {
  enable = true;
    arkenfox = {
      enable = true;
      version = "128.0";
  };
  package = pkgs.firefox-bin .override {
};
  policies = {
    DisableFirefoxStudies = true;
    DisablePocket = true;
    DisableFirefoxAccounts = true;
};
 profiles.cat = {
  arkenfox = {
    "0000".enable = true;
    "0100" = {
    "0104"."browser.newtabpage.enabled".value = true;
};
    "4500" = {
    enable = true;
    "4504"."privacy.resistFingerprinting.letterboxing".value = false;
    "4504"."privacy.resistFingerprinting.letterboxing.dimensions".value = "1920x1080";
    "4501"."privacy.resistFingerprinting".value = false;
};
    "8000" = {
    enable = true;
    "0803"."browser.search.suggest.enabled".value = true;
    "0803"."browser.urlbar.suggest.searches".value = true;
};
    "5000" = {
    enable = true;
    "5021"."keyboard.enabled".value = true;
};
    "5500" = {
    enable = true;
    "5508"."media.eme.enabled".value = true;
};
    "7000" = {
    enable = true;
    "7020"."media.peerconnection.enabled".value = true;
};
    "0200".enable = true;
    "0300".enable = true;
    "0400".enable = true;
    "0600".enable = true;
};

#   userChrome = ''
#     #alltabs-button { display: none !important; }
# '';

  userContent = ''
        @-moz-document url("about:newtab"), url("about:home") {
  :root[lwt-newtab-brighttext] {
    --newtab-background-color: #1e1e20 !important;
    --newtab-background-color-secondary: #4f4f54 !important;
    --newtab-wordmark-color: #f5e0dc !important;
}

   .logo {
   display: none !important;
   }

    #searchSubmit {
    display: none;
    }
    .ds-top-sites {
    display: none;
    }
    }
}
'';

  extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
    darkreader
    ublock-origin
#     libredirect
    mal-sync
    xbrowsersync
];

  search = {
    force = true;
      default = "DuckDuckGo";
        order = [ "DuckDuckGo" "Google" "Nix Packages" "Github" ];
         engines = {
           "Amazon.com".metaData.hidden = true;
           "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Twitter".metaData.hidden = true;
            "Facebook".metaData.hidden = true;
            "Youtube".metaData.hidden = true;
            "Reddit".metaData.hidden = true;
            "Google".metaData.hidden = "@g";
            "Wikipedia".metaData.hidden = true;
            "GitHub" = {
                urls = [{
                  template = "https://github.com/search";
                    params = [
                      { name = "q"; value = "{searchTerms}"; }
                   ];
                }];
                  icon = "${pkgs.fetchurl {
                    url = "https://github.githubassets.com/favicons/favicon.svg";
                    sha256 = "sha256-apV3zU9/prdb3hAlr4W5ROndE4g3O1XMum6fgKwurmA=";
                }}";
                  definedAliases = [ "@gh" ];
};
            "Nix Packages" = {
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "channel"; value = "unstable"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                  icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                    definedAliases = [ "@np" ];
};
            "paulgo" = {
                urls = [{
                  template = "https://paulgo.io/search";
                  params = [
                    { name = "q"; value = "{searchTerms}"; }
                  ];
              }];
            };
  };
};
        settings = {
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "general.smoothScroll.msdPhysics.enabled" = true;
          "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 250;
          "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 400;
          "general.smoothScroll.msdPhysics.regularSpringConstant" = 400;
          "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 120;
          "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" =  0.4;
          "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 5000;
          "mousewheel.min_line_scroll_amount" = 22;
          "toolkit.scrollbox.horizontalScrollDistance" = 4;
          "toolkit.scrollbox.verticalScrollDistance" = 5;
          "apz.frame_delay.enabled" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
          "browser.contentblocking.category" = "custom";
          "browser.formfill.enable" = false;
          "network.cookie.cookieBehavior" = 5;
          "privacy.clearOnShutdown.cookies" = true;
          "privacy.clearOnShutdown.offlineApps" = true;
          "privacy.clearOnShutdown.history" = true;
          "privacy.clearOnShutdown.downloads" = true;
          "privacy.clearOnShutdown.formdata" = true;
          "signon.rememberSignons" = false;
          "privacy.cpd.offlineApps" = false;
          "privacy.sanitize.sanitizeOnShutdown" = true;
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";
          "browser.ping-centre.telemetry" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          #"network.trr.mode" = 3;
          #"app.normandy.api_url" = "";
          "app.normandy.enabled" = false;
          "app.shield.optoutstudies.enabled" = false;
          "browser.safebrowsing.appRepURL" = "";
          "browser.safebrowsing.blockedURIs.enabled" = false;
          "browser.safebrowsing.downloads.enabled" = false;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "browser.safebrowsing.downloads.remote.url" = "";
          "browser.safebrowsing.enabled" = false;
          "browser.safebrowsing.malware.enabled" = false;
          "browser.safebrowsing.phishing.enabled" = false;
          "browser.urlbar.groupLabels.enabled" = false;
          "browser.urlbar.quicksuggest.enabled" = false;
          "extensions.shield-recipe-client.api_url" = "";
          "extensions.shield-recipe-client.enabled" = false;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.theme.content-theme" = "2";
          #"network.dns.disablePrefetch" = true;
          #"network.dns.disablePrefetchFromHTTPS" = true;
          "browser.send_pings" = false;
          "browser.download.useDownloadDir" = false;
          "browser.tabs.cardPreview.enabled" = false;
          "browser.tabs.cardPreview.showThumbnails" = false;
          "browser.tabs.inTitlebar" = 0;
          "browser.tabs.firefox-view" = false;
          "browser.tabs.firefox-view-newIcon" = false;
          "browser.tabs.tabmanager.enabled" = false;
          "browser.tabs.firefox-view-next" = false;
      };
    };
  };
}
