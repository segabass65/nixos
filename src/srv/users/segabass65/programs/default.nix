{ config, pkgs, ... }: {
  imports = [
    ./fastfetch.nix
    ./zsh.nix
  ];

  programs = {
    git.enable = true;
    home-manager.enable = true;
    neovim.enable = true;
    rtorrent.enable = true;
    uv.enable = true;
    vifm.enable = true;
  };
}
