{ config, inputs, osConfig, ... }: {
  imports = [
    ./packages.nix
    ./programs
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = osConfig.catppuccin.enable;
    accent = osConfig.catppuccin.accent;
    flavor = osConfig.catppuccin.flavor;
  };
  
  home = {
    homeDirectory = "/home/${config.home.username}";
    stateVersion = osConfig.system.stateVersion;
  };
}
