{ config, pkgs, ... }:
{
  programs.librewolf = {
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
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
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
        "webgl.disabled" = false;
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "network.cookie.lifetimePolicy" = 0;
        "extensions.pocket.enabled" = false;
        "browser.topsites.contile.enabled" = false;
        "browser.aboutConfig.showWarning" = false;
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
        "sidebar.visibility" = "hide-sidebar";
        "signon.management.page.breach-alerts.enabled" = false;
        "signon.rememberSignons" = false;
        "privacy.trackingprotection.allow_list.convenience.enabled" = true;
        "general.autoScroll" = true;
        "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
        "browser.warnOnQuitShortcut" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.tabs.groups.smart.userEnabled" = false;
        "browser.newtabpage.activity-stream.showWeather" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "findbar.highlightAll" = true;
        "browser.ml.chat.menu" = false;
        "browser.bookmarks.addedImportButton" = false;
        "middlemouse.paste" = false;
        "clipboard.autocopy" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      };
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
        path = "profile_0";
        search = {
          default = "ddg";
          force = true; 
        };
        #userChrome = ./shimmer/userChrome.css;
        #userContent = ./shimmer/userContent.css;
        extraConfig = ''
            user_pref("shimmer.remove-winctr-buttons", true);
            user_pref("sidebar.revamp", false);
            user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"sponsorblocker_ajay_app-browser-action\",\"_5cce4ab5-3d47-41b9-af5e-8203eea05245_-browser-action\"],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"vertical-spacer\",\"urlbar-container\",\"customizableui-special-spring2\",\"downloads-button\",\"fxa-toolbar-menu-button\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"_3c078156-979c-498b-8990-85f7987dd929_-browser-action\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\"],\"vertical-tabs\":[],\"PersonalToolbar\":[\"import-button\",\"personal-bookmarks\"]},\"seen\":[\"developer-button\",\"screenshot-button\",\"_3c078156-979c-498b-8990-85f7987dd929_-browser-action\",\"_5cce4ab5-3d47-41b9-af5e-8203eea05245_-browser-action\",\"sponsorblocker_ajay_app-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"ublock0_raymondhill_net-browser-action\"],\"dirtyAreaCache\":[\"nav-bar\",\"vertical-tabs\",\"PersonalToolbar\",\"unified-extensions-area\",\"toolbar-menubar\",\"TabsToolbar\"],\"currentVersion\":23,\"newElementCount\":4}");
          '';
        
        extensions.force = true;
        extensions.settings = {
          # Detach Tab
          "claymont@mail.com_detach-tab".settings.private_browsing = true;
          # Bitwarden
          #"{446900e4-71c2-419f-a6a7-df9c091e268b}".settings.private_browsing = true; # disabled to stop being logged out every time bowser is closed
          # uBlock Origin
          "uBlock0@raymondhill.net".settings.private_browsing = true;
          # Sidebery
          "{3c078156-979c-498b-8990-85f7987dd929}".settings = {
            private_browsing = true;
            settings = {
              nativeScrollbars = true;
              nativeScrollbarsThin = true;
              nativeScrollbarsLeft = false;
              selWinScreenshots = false;
              updateSidebarTitle = true;
              markWindow = true;
              markWindowPreface = "​";
              ctxMenuNative = false;
              ctxMenuRenderInact = true;
              ctxMenuRenderIcons = true;
              ctxMenuIgnoreContainers = "";
              navBarLayout = "horizontal";
              navBarInline = true;
              navBarSide = "left";
              hideAddBtn = false;
              hideSettingsBtn = false;
              navBtnCount = true;
              hideEmptyPanels = true;
              hideDiscardedTabPanels = false;
              navActTabsPanelLeftClickAction = "none";
              navActBookmarksPanelLeftClickAction = "none";
              navTabsPanelMidClickAction = "discard";
              navBookmarksPanelMidClickAction = "none";
              navSwitchPanelsWheel = true;
              subPanelRecentlyClosedBar = true;
              subPanelBookmarks = true;
              subPanelHistory = true;
              subPanelSync = false;
              groupLayout = "grid";
              containersSortByName = false;
              skipEmptyPanels = false;
              dndTabAct = true;
              dndTabActDelay = 750;
              dndTabActMod = "none";
              dndExp = "pointer";
              dndExpDelay = 750;
              dndExpMod = "none";
              dndOutside = "win";
              dndActTabFromLink = true;
              dndActSearchTab = true;
              dndMoveTabs = false;
              dndMoveBookmarks = false;
              searchBarMode = "dynamic";
              searchPanelSwitch = "same_type";
              searchBookmarksShortcut = "";
              searchHistoryShortcut = "";
              warnOnMultiTabClose = "collapsed";
              activateLastTabOnPanelSwitching = true;
              activateLastTabOnPanelSwitchingLoadedOnly = true;
              switchPanelAfterSwitchingTab = "always";
              tabRmBtn = "hover";
              activateAfterClosing = "next";
              activateAfterClosingStayInPanel = false;
              activateAfterClosingGlobal = false;
              activateAfterClosingNoFolded = true;
              activateAfterClosingNoDiscarded = true;
              askNewBookmarkPlace = true;
              tabsRmUndoNote = true;
              tabsUnreadMark = false;
              tabsUpdateMark = "all";
              tabsUpdateMarkFirst = true;
              tabsReloadLimit = 5;
              tabsReloadLimitNotif = true;
              showNewTabBtns = true;
              newTabBarPosition = "after_tabs";
              tabsPanelSwitchActMove = false;
              tabsPanelSwitchActMoveAuto = true;
              tabsUrlInTooltip = "full";
              newTabCtxReopen = false;
              tabWarmupOnHover = true;
              tabSwitchDelay = 0;
              forceDiscard = true;
              moveNewTabPin = "start";
              moveNewTabParent = "last_child";
              moveNewTabParentActPanel = false;
              moveNewTab = "end";
              moveNewTabActivePin = "start";
              pinnedTabsPosition = "panel";
              pinnedTabsList = false;
              pinnedAutoGroup = false;
              pinnedNoUnload = false;
              pinnedForcedDiscard = false;
              tabsTree = true;
              groupOnOpen = true;
              tabsTreeLimit = "none";
              autoFoldTabs = false;
              autoFoldTabsExcept = "none";
              autoExpandTabs = false;
              autoExpandTabsOnNew = false;
              rmChildTabs = "folded";
              tabsLvlDots = true;
              discardFolded = false;
              discardFoldedDelay = 0;
              discardFoldedDelayUnit = "sec";
              tabsTreeBookmarks = true;
              treeRmOutdent = "branch";
              autoGroupOnClose = false;
              autoGroupOnClose0Lvl = false;
              autoGroupOnCloseMouseOnly = false;
              ignoreFoldedParent = false;
              showNewGroupConf = true;
              sortGroupsFirst = true;
              colorizeTabs = false;
              colorizeTabsSrc = "domain";
              colorizeTabsBranches = false;
              colorizeTabsBranchesSrc = "url";
              inheritCustomColor = true;
              previewTabs = false;
              previewTabsMode = "i";
              previewTabsPageModeFallback = "w";
              previewTabsInlineHeight = 70;
              previewTabsPopupWidth = 280;
              previewTabsTitle = 2;
              previewTabsUrl = 1;
              previewTabsSide = "right";
              previewTabsDelay = 500;
              previewTabsFollowMouse = true;
              previewTabsWinOffsetY = 36;
              previewTabsWinOffsetX = 6;
              previewTabsInPageOffsetY = 0;
              previewTabsInPageOffsetX = 0;
              previewTabsCropRight = 0;
              hideInact = false;
              hideFoldedTabs = false;
              hideFoldedParent = "none";
              nativeHighlight = true;
              warnOnMultiBookmarkDelete = "collapsed";
              autoCloseBookmarks = false;
              autoRemoveOther = false;
              highlightOpenBookmarks = false;
              activateOpenBookmarkTab = false;
              showBookmarkLen = true;
              bookmarksRmUndoNote = true;
              loadBookmarksOnDemand = true;
              pinOpenedBookmarksFolder = true;
              oldBookmarksAfterSave = "ask";
              loadHistoryOnDemand = true;
              fontSize = "m";
              animations = true;
              animationSpeed = "norm";
              theme = "proton";
              density = "default";
              colorScheme = "ff";
              snapNotify = true;
              snapExcludePrivate = false;
              snapInterval = 0;
              snapIntervalUnit = "min";
              snapLimit = 0;
              snapLimitUnit = "snap";
              snapAutoExport = false;
              snapAutoExportType = "json";
              snapAutoExportPath = "Sidebery/snapshot-%Y.%M.%D-%h.%m.%s";
              snapMdFullTree = false;
              hScrollAction = "none";
              onePanelSwitchPerScroll = false;
              wheelAccumulationX = true;
              wheelAccumulationY = true;
              navSwitchPanelsDelay = 128;
              scrollThroughTabs = "none";
              scrollThroughVisibleTabs = true;
              scrollThroughTabsSkipDiscarded = true;
              scrollThroughTabsExceptOverflow = true;
              scrollThroughTabsCyclic = false;
              scrollThroughTabsScrollArea = 0;
              autoMenuMultiSel = true;
              multipleMiddleClose = false;
              longClickDelay = 500;
              wheelThreshold = false;
              wheelThresholdX = 10;
              wheelThresholdY = 60;
              tabDoubleClick = "none";
              tabsSecondClickActPrev = true;
              tabsSecondClickActPrevPanelOnly = false;
              tabsSecondClickActPrevNoUnload = false;
              shiftSelAct = true;
              activateOnMouseUp = false;
              tabLongLeftClick = "none";
              tabLongRightClick = "none";
              tabMiddleClick = "close";
              tabPinnedMiddleClick = "discard";
              tabMiddleClickCtrl = "discard";
              tabMiddleClickShift = "duplicate";
              tabCloseMiddleClick = "close";
              tabsPanelLeftClickAction = "none";
              tabsPanelDoubleClickAction = "tab";
              tabsPanelRightClickAction = "menu";
              tabsPanelMiddleClickAction = "tab";
              newTabMiddleClickAction = "new_child";
              bookmarksLeftClickAction = "open_in_act";
              bookmarksLeftClickActivate = false;
              bookmarksLeftClickPos = "default";
              bookmarksMidClickAction = "open_in_new";
              bookmarksMidClickActivate = false;
              bookmarksMidClickRemove = false;
              bookmarksMidClickPos = "default";
              historyLeftClickAction = "open_in_act";
              historyLeftClickActivate = false;
              historyLeftClickPos = "default";
              historyMidClickAction = "open_in_new";
              historyMidClickActivate = false;
              historyMidClickPos = "default";
              syncName = "";
              syncUseFirefox = true;
              syncUseGoogleDrive = false;
              syncUseGoogleDriveApi = false;
              syncUseGoogleDriveApiClientId = "";
              syncSaveSettings = false;
              syncSaveCtxMenu = false;
              syncSaveStyles = false;
              syncSaveKeybindings = false;
              selectActiveTabFirst = true;
              selectCyclic = false;
            };
            sidebar = {
              nav = ["9iD_gaHrxpAp" "4ZrFYm0fG7Ah" "add_tp" "sp-0" "settings"];
              panels = {
                "4ZrFYm0fG7Ah" = {
                  type = 2;
                  id = "4ZrFYm0fG7Ah";
                  name = "Tabs";
                  color = "toolbar";
                  iconSVG = "icon_tabs";
                  iconIMGSrc = "";
                  iconIMG = "";
                  lockedPanel = false;
                  skipOnSwitching = false;
                  noEmpty = false;
                  newTabCtx = "none";
                  dropTabCtx = "none";
                  moveRules = [];
                  moveExcludedTo = -1;
                  bookmarksFolderId = -1;
                  newTabBtns = [];
                  srcPanelConfig = null;
                };
                "9iD_gaHrxpAp" = {
                  type = 2;
                  id = "9iD_gaHrxpAp";
                  name = "Tabs";
                  color = "toolbar";
                  iconSVG = "icon_tabs";
                  iconIMGSrc = "";
                  iconIMG = "";
                  lockedPanel = false;
                  skipOnSwitching = false;
                  noEmpty = false;
                  newTabCtx = "none";
                  dropTabCtx = "none";
                  moveRules = [];
                  moveExcludedTo = -1;
                  bookmarksFolderId = -1;
                  newTabBtns = [];
                  srcPanelConfig = null;
                };
              };
            };
            sidebarCSS = [
              ''
                #root.root {--general-margin: 6px;}
                #root.root {--general-border-radius: 8px;}

                #nav_bar {
                	padding: 12px !important;
                }

                #root.root {--toolbar-bg: transparent;}

                .Tab .body::before, .NavigationBar .nav-item, .Sidebar .tool-btn::before, .TabsPanel .new-tab-btn::before, .CtxMenu .opt::before, .icon-opt::before {
                	transition: background 0.075s linear, opacity 0.075s linear;
                }

                .hidden-panels-popup-layer > * {
                	background: var(--s-frame-bg) !important;
                }

                /* \/ \/ \/ COMMENT OUT TO DISABLE COLLAPSING SIDEBAR \/ \/ \/ */

                #root:not(:hover) .top-horizontal-box, #root:not(:hover) .BottomBar {
                	opacity: 0;
                	transition: all 0s;
                }
                #root .top-horizontal-box, #root .BottomBar {
                	transition: opacity 0.25s cubic-bezier(0.075, 0.82, 0.165, 1) !important;
                }
                #root:not(:hover) .scroll-container {
                	overflow: hidden;
                }
                #root:not(:hover) .scroll-container > * {
                	width: fit-content;
                }
                #root:not(:hover) .Tab {
                	padding-left: 0 !important;
                }
                #root:not(:hover) .Tab > .body > *:not(.fav) {
                	display: none !important;
                }
                #root:not(:hover) .new-tab-btns svg {
                	opacity: 0 !important;
                	transition: opacity 0.25s cubic-bezier(0.075, 0.82, 0.165, 1);
                }
                #root:not(:hover) .new-tab-btns {
                	transition: all 0.25s cubic-bezier(0.075, 0.82, 0.165, 1);
                }
                #root:not(:hover) .top-shadow, #root:not(:hover) .bottom-shadow, #root:not(:hover) .scroll-container .new-tab-btns::before {
                	display: none;
                }
              ''
            ];
          };
        };
      };
    };
  };
  
  stylix.targets.librewolf = {
    profileNames = [ "profile_0" ];
    colorTheme.enable = true;
    colors.enable = true;
  };

}