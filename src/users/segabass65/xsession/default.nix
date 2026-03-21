{ pkgs, ... }: {
  imports = [
    ./bspwm.nix
  ];

  home.packages = with pkgs; [
    hsetroot
  ];
  
  xsession = {
    enable = true;
    initExtra = "hsetroot -solid '#181825'";
    scriptPath = ".xinitrc";
  };
}
