{ config, lib, pkgs, ... }: let
  palette = (
    lib.importJSON "${config.catppuccin.sources.palette}/palette.json"
  ).${config.catppuccin.flavor}.colors;

in {
  imports = [
    ./bspwm.nix
  ];

  home.packages = with pkgs; [
    hsetroot
  ];
  
  xsession = {
    enable = true;
    initExtra = "hsetroot -solid '${palette.mantle.hex}'";
    scriptPath = ".xinitrc";
  };
}
