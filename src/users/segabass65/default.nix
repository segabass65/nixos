{ config, inputs, isServer, osConfig, ... }: let
  modules = {
    server = [
      ./programs
      inputs.catppuccin.homeModules.catppuccin
    ];
    desktop = [
    ./services
    ./xsession
    ] ++ modules.server;
  };

in {
  imports = if isServer then modules.server else modules.desktop;

  catppuccin = {
    enable = osConfig.catppuccin.enable;
    accent = osConfig.catppuccin.accent;
    flavor = osConfig.catppuccin.flavor;
  };
  
  home = {
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.11";
  };
}
