{ config, host, lib, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "sd_mod" ];
    kernelModules = [ "kvm-intel" ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXROOT";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
    "/home" = {
      device = "/dev/disk/by-label/NIXHOME";
      fsType = "ext4";
    };
    "/games" = {
      device = "/dev/disk/by-label/GAMES";
      fsType = "ext4";
    };
    "/data" = {
      device = "/dev/disk/by-label/DATA";
      fsType = "ext4";
    };
    "/var/lib/libvirt" = {
      device = "/dev/disk/by-label/LIBVIRT";
      fsType = "ext4";
    };
  };

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault
      config.hardware.enableRedistributableFirmware;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault host.platform;
  services.xserver.videoDrivers = [ "nvidia" ];
  time.timeZone = "Europe/Moscow";
}
