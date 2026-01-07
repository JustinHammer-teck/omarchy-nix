{ config, lib, ... }:
let
  cfg = config.omarchy;
in
{
  programs.git = lib.mkDefault {
    enable = true;
    settings = {
      userName = cfg.full_name;
      userEmail = cfg.email_address;
      extraConfig = {
        credential.helper = "store";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
}
