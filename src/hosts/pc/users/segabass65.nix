{ inputs, pkgs, self, ... }: let
  username = "segabass65";

in {
  home-manager.users.${username} = {
    imports = [
      "${self}/users/${username}"
      inputs.catppuccin.homeModules.catppuccin
    ];

    home = { inherit username; };
  };

  users.users.${username} = {
    extraGroups = [
      "kvm"
      "libvirtd"
      "wheel"
    ];

    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
