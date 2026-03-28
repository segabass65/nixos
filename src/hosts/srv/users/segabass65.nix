{ inputs, pkgs, ... }: let
  username = "segabass65";

in {
  home-manager.users.${username} = {
    imports = [
      "${inputs.self}/users/${username}"
    ];

    home = { inherit username; };
  };

  users.users.${username} = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
