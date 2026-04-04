{ inputs, osConfig, ... }: {
  imports = [
    ./home.nix
    ./programs
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = osConfig.catppuccin.enable;
    accent = osConfig.catppuccin.accent;
    flavor = osConfig.catppuccin.flavor;
  }; 
}
