{ lib, config, pkgs, ...}:

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "sdasappan";
      description = ''
       Stella
      '';
    };
  };
  
  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      description = "Stella";
      initialPassword = "password";
      shell = pkgs.zsh;
      extraGroups = [ "networkmanager" "wheel" "dialout" ];
      packages = with pkgs; [];    
    };
  };
}
