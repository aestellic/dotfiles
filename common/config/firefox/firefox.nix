{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];

    /* ---- POLICIES ---- */
    # Check about:policies#documentation for options.
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"

      /* ---- EXTENSIONS ---- */
      # Check about:support for extension/add-on ID strings.
      # Valid strings for installation_mode are "allowed", "blocked",
      # "force_installed" and "normal_installed".
      ExtensionSettings = {
        "*".installation_mode = "allowed";
        
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/uborigin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Bitwarden
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
        # Control Panel for Twitter
        "{5cce4ab5-3d47-41b9-af5e-8203eea05245}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/control-panel-for-twitter/latest.xpi";
          installation_mode = "force_installed";
        };
        # Detach Tab
        "claymont@mail.com_detach-tab" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/detach-tab/latest.xpi";
          installation_mode = "force_installed";
        };
        # Firefox Color
        "FirefoxColor@mozilla.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
          installation_mode = "force_installed";
        };
        # Sidebery
        "{3c078156-979c-498b-8990-85f7987dd929}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sidebery/latest.xpi";
          installation_mode = "force_installed";
        };
        # SponsorBlock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      /* ---- PREFERENCES ---- */
      # Check about:config for options.
      Preferences = { 
        "extensions.pocket.enabled" = false;
        "browser.topsites.contile.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.search.suggest.enabled" = false;
        "browser.search.suggest.enabled.private" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.showSearchSuggestionsFirst" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
        "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "svg.context-properties.content.enabled" = true;
        "sidebar.revamp" = false;
        "shimmer.remove-winctr-buttons" = false;
      };

      /* ---- PROFILES ---- */
      # Switch profiles via about:profiles page.
      # For options that are available in Home-Manager see
      # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
      profiles ={
        profile_0 = {           # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
          id = 0;               # 0 is the default profile; see also option "isDefault"
          name = "profile_0";   # name as listed in about:profiles
          isDefault = true;     # can be omitted; true if profile ID is 0
          settings = {          # specify profile-specific preferences here; check about:config for options
            # add preferences for profile_0 here...
          };
          userChrome = "/home/sdasappan/.dotfiles/common/firefox/shimmer/userChrome.css";
          userContent = "/home/sdasappan/.dotfiles/common/firefox/shimmer/userContent.css";
          # NOTE: You have to manually import sidebery settings and Firefox Color settings
          # https://color.firefox.com/?theme=XQAAAAJEBAAAAAAAAABBqYhm849SCicxcUcPX38oKRicm6da8pFtMcajvXaAE3RJ0F_F447xQs-L1kFlGgDKq4IIvWciiy4upusW7OvXIRinrLrwLvjXB37kvhN5ElayHo02fx3o8RrDShIhRpNiQMOdww5V2sCMLAfehhpNuTUzCCysnMav9-dMeCS-YdrUYNRq_65Vh7TlxjqqIEBwOL_OoPPzToHWKzukcQaRsZUnty3oxorbtIosU9WVXZVe5ImQLK4GyxY9IaGdk_4jpW4cVdaKPaDGD6P_nSqysKos2ATQ16qOOYp7ekq4tWW2fF74tUqB_0WbB4Q5I0qKeUW2NfJMOkcGyTetLVRsE1GPMMh0hw6mSEYxm9KxMQC1bS56dsWnK7ZGTJyiMYGRtcOxp2_1WnhezQVdo7WCmNNcB6UOu1usj9vfd5y5MtnkVbQO6y2NHx4V62RLNJkb1NhaehWE7sXRBy07YJp5WGrU2xg-Pzx5kwVEpf0P0uNggg9gGnBsZ1Z6M6A_C6y5OP8RpqKWGD3O58CLSYN9fZR1_p9Iffs1HyDT9XD_4Y0ysg
        };
      };
    };
  };
}