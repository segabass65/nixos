{ inputs, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./programs.nix
    ./services.nix
    ./users
    inputs.catppuccin.nixosModules.catppuccin
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_zen;
  };
  
  catppuccin.enable = true;
  environment.systemPackages = [ pkgs.home-manager ];
  networking.nftables.enable = true;
  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  system.stateVersion = "25.11";

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };
}
