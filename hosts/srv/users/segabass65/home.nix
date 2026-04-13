{ config, pkgs, osConfig, ... }: {
  home = {
    homeDirectory = "/home/${config.home.username}";

    packages = with pkgs; [
      cmatrix
      efibootmgr
      gnumake
      htop
      ouch
      topydo
      tree
      tty-clock
      wget
    ];

    stateVersion = osConfig.system.stateVersion;
  };
}
