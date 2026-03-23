{ pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./users
  ];

  boot.loader.systemd-boot.enable = true;

  catppuccin.enable = true;

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
