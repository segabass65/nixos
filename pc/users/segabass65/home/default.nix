{ config, osConfig, ... }: {
  imports = [
    ./bin.nix
    ./packages.nix
  ];

  home = {
    homeDirectory = "/home/${config.home.username}";
    stateVersion = osConfig.system.stateVersion;
  };
}
