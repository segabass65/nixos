{ config, lib, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [
      "nvme"
      "xhci_pci"
      "ahci"
      "usb_storage"
      "usbhid"
      "sd_mod"
    ];
    kernelModules = [ "yt6801" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
    "/home" = {
      device = "/dev/disk/by-label/HOME";
      fsType = "ext4";
    };
  };

  hardware.cpu.amd.updateMicrocode = true;
  time.timeZone = "Europe/Moscow";
}
