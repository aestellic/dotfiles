{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Catppuccin Noctis Mocha";
        "workbench.iconTheme" = "Catppuccin Noctis Icons";
        "editor.bracketPairColorization.enabled" = true;
        "editor.guides.bracketPairs" = "active";
      };
      extensions = with pkgs.vscode-marketplace; [
        alexdauenhauer.catppuccin-noctis
        alexdauenhauer.catppuccin-noctis-icons
        jnoortheen.nix-ide
      ];
    };
  };
}