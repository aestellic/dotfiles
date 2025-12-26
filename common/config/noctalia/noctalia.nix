{ pkgs, inputs, ... }:
{
  home-manager.users.sdasappan = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      appLauncher = {
        backgroundOpacity = 1;
          customLaunchPrefix = "";
          customLaunchPrefixEnabled = false;
          enableClipboardHistory = true;
            position = "center";
            sortByMostUsed = true;
            terminalCommand = "ghostty";
            useApp2Unit = false;
        };
        audio = {
            cavaFrameRate = 60;
            mprisBlacklist = [];
            preferredPlayer = "quodlibet";
            visualizerType = "linear";
            volumeOverdrive = false;
            volumeStep = 5;
        };
        bar = {
          density = "default";
          exclusive = true;
          floating = true;
          marginHorizontal = 0.25;
          marginVertical = 0.25;
          monitors = [];
          outerCorners = false;
          position = "top";
          showCapsule = true;
          widgets = {
            center = [
              {
                  characterCount = 2;
                  hideUnoccupied = false;
                  id = "Workspace";
                  labelMode = "index";
              }
            ];
            left = [
              {
                  id = "SystemMonitor";
                  showCpuTemp = true;
                  showCpuUsage = true;
                  showDiskUsage = false;
                  showMemoryAsPercent = false;
                  showMemoryUsage = true;
                  showNetworkStats = false;
              }
              {
                  colorizeIcons = false;
                  hideMode = "hidden";
                  id = "ActiveWindow";
                  maxWidth = 145;
                  scrollingMode = "hover";
                  showIcon = true;
                  useFixedWidth = false;
              }
              {
                  id = "AudioVisualizer";
              }
            ];
            right = [
              {
                  blacklist = [
                  ];
                  colorizeIcons = false;
                  id = "Tray";
              }
              {
                  hideWhenZero = true;
                  id = "NotificationHistory";
                  showUnreadBadge = true;
              }
              {
                  displayMode = "onhover";
                  id = "Volume";
              }
              {
                  customFont = "";
                  formatHorizontal = "ddd MMM d | h:mm AP";
                  formatVertical = "h:mmAP ddd MM/d";
                  id = "Clock";
                  useCustomFont = false;
                  usePrimaryColor = true;
              }
              {
                  customIconPath = "";
                  icon = "noctalia";
                  id = "ControlCenter";
                  useDistroLogo = true;

              }
            ];
          };
        };
        battery = {
          chargingMode = 0;
        };
        brightness = {
          brightnessStep = 5;
          enableDdcSupport = true;
          enforceMinimum = true;
        };
        colorSchemes = {
          darkMode = true;
          generateTemplatesForPredefined = false;
          manualSunrise = "06 =30";
          manualSunset = "18 =30";
          matugenSchemeType = "scheme-fruit-salad";
          predefinedScheme = "Stylix";
          schedulingMode = "off";
          useWallpaperColors = false;
        };
        controlCenter = {
          cards = [
            {
                enabled = true;
                id = "profile-card";
            }
            {
                enabled = true;
                id = "shortcuts-card";
            }
            {
                enabled = true;
                id = "audio-card";
            }
            {
                enabled = false;
                id = "weather-card";
            }
            {
                enabled = true;
                id = "media-sysmon-card";
            }
          ];
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "ScreenRecorder";
              }
              {
                id = "WallpaperSelector";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "PowerProfile";
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
            ];
          };
        };
        dock = {
          enabled = false;
        };
        general = {
          animationDisabled = false;
          animationSpeed = 1;
          avatarImage = "/home/sdasappan/.face";
          compactLockScreen = true;
          dimDesktop = true;
          enableShadows = true;
          forceBlackScreenCorners = true;
          language = "";
          lockOnSuspend = true;
          radiusRatio = 1;
          scaleRatio = 1;
          screenRadiusRatio = 1;
          showScreenCorners = true;
        };
        hooks = {
          darkModeChange = "";
          enabled = false;
          wallpaperChange = "";
        };
        "location" = {
          name = "New York";
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
          showCalendarEvents = true;
          showCalendarWeather = true;
          showWeekNumberInCalendar = false;
          use12hourFormat = true;
          useFahrenheit = true;
          weatherEnabled = false;
        };
        network = {
          wifiEnabled = true;
        };
        nightLight = {
          autoSchedule = true;
          dayTemp = "6500";
          enabled = true;
          forced = false;
          manualSunrise = "06 =30";
          manualSunset = "18 =30";
          nightTemp = "5000";
        };
        notifications = {
          criticalUrgencyDuration = 15;
          doNotDisturb = false;
          location = "bottom";
          lowUrgencyDuration = 3;
          monitors = [];
          normalUrgencyDuration = 8;
          overlayLayer = true;
          respectExpireTimeout = false;
        };
        osd = {
          autoHideMs = 2000;
          enabled = true;
          location = "top";
          monitors = [];
          overlayLayer = true;
        };
        screenRecorder = {
          audioCodec = "opus";
          "audioSource" = "default_output";
          colorRange = "limited";
          directory = "/home/sdasappan/Videos";
          frameRate = 60;
          quality = "very_high";
          showCursor = true;
          videoCodec = "h264";
          videoSource = "portal";
        };
        settingsVersion = 18;
        setupCompleted = true;
        templates = {
          alacritty = false;
          code = false;
          discord = false;
          discord_armcord = false;
          discord_dorion = false;
          discord_equibop = false;
          discord_lightcord = false;
          discord_vesktop = true;
          discord_webcord = false;
          enableUserTemplates = false;
          foot = false;
          fuzzel = false;
          ghostty = false;
          gtk = true;
          kcolorscheme = true;
          kitty = false;
          pywalfox = false;
          qt = true;
          vicinae = false;
          walker = false;
          wezterm = false;
        };
        ui = {
          fontDefaultScale = 1;
          fontFixed = "DejaVu Sans Mono";
          fontFixedScale = 1;
          panelsAttachedToBar = true;
          panelsOverlayLayer = false;
          tooltipsEnabled = true;
        };
        wallpaper = {
          defaultWallpaper = "/home/sdasappan/.dotfiles/common/wallpapers/flowers.png";
          directory = "/home/sdasappan/.dotfiles/common/wallpapers";
          enableMultiMonitorDirectories = false;
          enabled = true;
          fillColor = "#000000";
          fillMode = "crop";
          panelPosition = "folow_bar";
          randomEnabled = false;
          randomIntervalSec = 300;
          recursiveSearch = false;
          setWallpaperOnAllMonitors = true;
          transitionDuration = 1500;
          transitionEdgeSmoothness = 0.05;
          transitionType = "random";
        };
      };
    };
  };
}