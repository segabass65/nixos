{ ... }: {
  imports = [
    ./assets/assets.nix
    ./hardware.nix
    ./misc.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./users.nix
    ./xdg/xdg.nix
  ];
}
