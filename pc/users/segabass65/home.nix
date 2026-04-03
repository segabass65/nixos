{ config, pkgs, osConfig, ... }: {
  home = {
    homeDirectory = "/home/${config.home.username}";

    packages = with pkgs; [
      argbash
      cmatrix
      efibootmgr
      git-filter-repo
      htop
      maim
      nerd-fonts.jetbrains-mono
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
