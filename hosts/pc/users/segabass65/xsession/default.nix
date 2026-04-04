{ palette, ... }: {
  imports = [
    ./bspwm.nix
  ];

  xsession = {
    enable = true;
    initExtra = "hsetroot -solid '${palette.mantle.hex}'";
    scriptPath = ".xinitrc";
  };
}
