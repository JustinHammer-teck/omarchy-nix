{ config, lib, ... }:
let
  cfg = config.omarchy;
in
{
  programs.git = lib.mkDefault {
    enable = true;
    settings = {
      user.name = cfg.full_name;
      user.email = cfg.email_address;
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
