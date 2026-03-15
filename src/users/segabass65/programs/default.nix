{ ... }: {
  imports = [
    ./fastfetch.nix
    ./kitty.nix
    ./librewolf
  ];

  programs = {
    cava.enable = true;
    home-manager.enable = true;
  };
}
