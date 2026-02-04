{ bootloader, host, pkgs, ... }: {
  boot.loader.${bootloader}.enable = true;

  catppuccin.enable = true;
  catppuccin.cursors.enable = true;

  networking.hostName = host.name;

  nix.settings.experimental-features = [ "flakes" "nix-command" ];
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "librewolf-bin-146.0.1-1"
      "librewolf-bin-unwrapped-146.0.1-1"
      "ventoy-qt5-1.1.07"
    ];
  };

  system.stateVersion = "25.11";

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      swtpm.enable = true;
      vhostUserPackages = [ pkgs.virtiofsd ];
    };
  };
}
