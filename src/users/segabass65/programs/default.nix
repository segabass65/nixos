{ isServer, ... }: let
  modules = {
    server = [
      ./fastfetch.nix
      ./zsh.nix
    ];
    desktop = [
      ./kitty.nix
      ./librewolf
    ] ++ modules.server;
  };

in {
  imports = if isServer then modules.server else modules.desktop;

  programs = {
    cava.enable = !isServer;
    home-manager.enable = true;
  };
}
