{ inputs, pkgs, ... }: let
  username = "segabass65";

in {
  home-manager.users.${username} = {
    imports = [ ./${username} ];
    
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
