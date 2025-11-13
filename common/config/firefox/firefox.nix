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
        # Catppuccin Mocha Green Theme
        "{f4363cd3-9ba9-453d-b2b2-66e6e1bafe73}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-green-git/latest.xpi";
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
          path = "profile_0";
          search.default = "ddg";
          userChrome = "/home/sdasappan/.dotfiles/common/firefox/shimmer/userChrome.css";
          userContent = "/home/sdasappan/.dotfiles/common/firefox/shimmer/userContent.css";
          extensions.settings = {
            "{3c078156-979c-498b-8990-85f7987dd929}".settings = {
              settings = [
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
              ];

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
                "#root.root {--general-margin, 6px;}"
                "#root.root {--general-border-radius, 8px;}"
                "#nav_bar {\tpadding, 12px !important;}"
                "#root.root {--toolbar-bg, transparent;}"
                ".Tab .body, .NavigationBar .nav-item, .Sidebar .tool-btn, .TabsPanel .new-tab-btn, .CtxMenu .opt, .icon-opt { transition, background 0.075s linear, opacity 0.075s linear; }"
                ".hidden-panels-popup-layer > * { background, var(--s-frame-bg) !important; }"
                "#root:not(hover) .top-horizontal-box, #root:not(hover) .BottomBar { opacity, 0; transition, all 0s; }"
                "#root .top-horizontal-box, #root .BottomBar { transition, opacity 0.25s cubic-bezier(0.075, 0.82, 0.165, 1) !important; }"
                "#root:not(hover) .scroll-container { overflow, hidden; }"
                "#root:not(hover) .scroll-container > * { width, fit-content; }"
                "#root:not(hover) .Tab { padding-left, 0 !important; }"
                "#root:not(hover) .Tab > .body > *:not(.fav) { display, none !important; }"
                "#root:not(hover) .new-tab-btns svg { opacity, 0 !important; transition, opacity 0.25s cubic-bezier(0.075, 0.82, 0.165, 1); }"
                "#root:not(hover) .new-tab-btns { transition, all 0.25s cubic-bezier(0.075, 0.82, 0.165, 1); }"
                "#root:not(hover) .top-shadow, #root:not(hover) .bottom-shadow, #root:not(hover) .scroll-container .new-tab-btns:before { display, none; }"
              ];
            };
          };
        };
      };
    };
  };
}