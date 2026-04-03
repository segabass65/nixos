{ config, inputs, lib, osConfig, ... }: {
  imports = [
    ./home
    ./programs
    ./services
    ./xsession
    inputs.catppuccin.homeModules.catppuccin
  ];

  _module.args.palette = (
    lib.importJSON "${config.catppuccin.sources.palette}/palette.json"
  ).${config.catppuccin.flavor}.colors;

  catppuccin = {
    enable = osConfig.catppuccin.enable;
    accent = osConfig.catppuccin.accent;
    flavor = osConfig.catppuccin.flavor;
  };
}
