{ config, pkgs, ... }: {
  imports = [
    ./fastfetch.nix
    ./kitty.nix
    ./librewolf
    ./zsh.nix
  ];

  programs = {
    cava.enable = true;

    git = {
      enable = true;
      settings = {
        user = {
          name = config.home.username;
          email = "andreypiskunov2008@gmail.com";
        };
      };
    };

    home-manager.enable = true;
    lutris.enable = true;
    neovim.enable = true;
    onlyoffice.enable = true;
    rtorrent.enable = true;
    uv.enable = true;
    vesktop.enable = true;
    vifm.enable = true;

    vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}
