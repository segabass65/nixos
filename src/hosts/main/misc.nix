{ bootloader, hostName, pkgs, ... }: {
  boot.loader.systemd-boot.enable = true;

  catppuccin.enable = true;

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
