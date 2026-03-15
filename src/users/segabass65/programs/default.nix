{ ... }: {
  imports = [
    ./fastfetch.nix
    ./kitty.nix
  ];

  programs = {
    cava.enable = true;
    home-manager.enable = true;
  };
}
