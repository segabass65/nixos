{ ... }: {
  imports = [
    ./hardware.nix
    ./misc.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./users.nix
  ];
}
