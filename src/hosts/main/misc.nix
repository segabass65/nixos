{ bootloader, hostName, pkgs, ... }: {
  boot.loader.${bootloader}.enable = true;

  catppuccin.enable = true;
  catppuccin.cursors.enable = true;

  networking.hostName = hostName;
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
