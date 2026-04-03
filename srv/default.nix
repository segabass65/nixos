{ inputs, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./users
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  catppuccin.enable = true;
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  programs.zsh.enable = true;
  system.stateVersion = "25.11";
}
