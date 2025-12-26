{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sdasappan";
  home.homeDirectory = "/home/sdasappan";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports =
  [
    ../../common/config/vscodium/vscodium.nix
    ../../common/config/librewolf/librewolf.nix
    ../../common/config/ghostty/ghostty.nix
    ../../common/config/vesktop/vencord.nix
    ../../common/config/vesktop/vesktop.nix
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    signal-desktop-bin
    localsend
    yt-dlg
    gimp3-with-plugins
    python3
    androidenv.androidPkgs.platform-tools
    brave
    feishin
    gnome-disk-utility
  ];

  programs = {
    ghostty.enable = true;
    vesktop.enable = true;
    fastfetch.enable = true;
    btop.enable = true;
    obs-studio.enable = true;
    cava.enable = true;
    git = {
      enable = true;
      settings = {
        user.name = "aestellic";
        user.email = "aestellic@protonmail.com";
        init.defaultBranch = "main";
      };
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    "niri_tweaks".source = builtins.fetchGit {
      url = "https://github.com/heyoeyo/niri_tweaks";
      ref =  "main";
      rev = "24f46e293955ac07416c522d1394eb793563f7d8";
    };

    ".face".source = ../../common/.face;

    ".zshrc".source = ../../common/.zshrc;

    ".mozilla/firefox/profile_0/chrome".source = ../../common/config/librewolf/shimmer;
  };

  xdg.configFile = {
    "niri/config.kdl".source = ../../common/config/niri/niri_config.kdl;
    "waybar/config.jsonc".source = ../../common/config/waybar/waybar_config.jsonc;
    "fastfetch".source = ../../common/config/fastfetch;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sdasappan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;    
}
