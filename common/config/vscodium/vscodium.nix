{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "editor.bracketPairColorization.enabled" = true;
        "editor.guides.bracketPairs" = "active";
      };
      extensions = with pkgs.vscode-marketplace; [
        jnoortheen.nix-ide
      ];
    };
  };
}