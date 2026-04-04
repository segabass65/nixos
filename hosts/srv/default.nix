{ inputs, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./boot.nix
    ./file-systems.nix
    ./users
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.home-manager
  ];

  catppuccin.enable = true;
  hardware.cpu.amd.updateMicrocode = true;
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  programs.zsh.enable = true;
  system.stateVersion = "25.11";
  time.timeZone = "Europe/Moscow";
}
