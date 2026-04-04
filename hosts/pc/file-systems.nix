{ ... }: {
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
    "/games" = {
      device = "/dev/disk/by-label/GAMES";
      fsType = "ext4";
    };
    "/data" = {
      device = "/dev/disk/by-label/DATA";
      fsType = "ext4";
    };
    "/vm" = {
      device = "/dev/disk/by-label/VM";
      fsType = "ext4";
    };
    "/repos" = {
      device = "/dev/disk/by-label/REPOS";
      fsType = "ext4";
    };
  };
}