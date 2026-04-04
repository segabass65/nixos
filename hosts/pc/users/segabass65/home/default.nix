{ config, osConfig, ... }: {
  imports = [
    ./bin.nix
    ./packages.nix
  ];

  home = {
    homeDirectory = "/home/${config.home.username}";

    keyboard = {
      layout = "us, ru";
      options = [ "grp:win_space_toggle" ];
    };

    stateVersion = osConfig.system.stateVersion;
  };
}
