{ config, pkgs, osConfig, ... }: {
  home = {
    homeDirectory = "/home/${config.home.username}";

    packages = with pkgs; [
      argbash
      cmatrix
      git-filter-repo
      htop
      maim
      ouch
      protonup-rs
      tree
      tty-clock
      ventoy
      wget
      wmutils-core
      xclip
      xtitle
    ];

    stateVersion = osConfig.system.stateVersion;
  };
}
