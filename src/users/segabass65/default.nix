{ config, ... }: {
  imports = [
    ./catppuccin.nix
    ./programs
    ./services
    ./xsession
  ];

  home = {
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.11";
  };
}
