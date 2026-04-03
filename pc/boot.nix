{ pkgs, ... }: {
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "ahci"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];
    kernelModules = [ "kvm-intel" ];
    kernelPackages = pkgs.linuxPackages_zen;
    loader.systemd-boot.enable = true;
  };
}
