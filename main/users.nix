{ pkgs, ... }: {
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      segabass65 = {
        isNormalUser = true;
        extraGroups = [
          "kvm"
          "libvirtd"
          "wheel"
        ];
      };
      tester = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
        ];
      };
    };
  };
}
