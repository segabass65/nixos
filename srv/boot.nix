{ config, pkgs, ... }: {
  boot = {
    extraModulePackages = [ config.boot.kernelPackages.yt6801 ];
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "ahci"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];
    kernelModules = [ "yt6801" ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
  };
}
