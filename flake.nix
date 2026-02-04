{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    catppuccin = {
      url = "github:catppuccin/nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs-unstable,
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  }: {

    nixosConfigurations = let
      os = "GNU/Linux";
      
    in {
      main = let
        host = {
          name = "main";
          platform = "x86_64-linux";
        };

        bootloader = "systemd-boot";
        theme = "mocha";

        pkgsUnstable = import nixpkgs-unstable {
          system = host.platform;
          config.allowUnfree = true;
        };

      in nixpkgs.lib.nixosSystem {
        modules = [
          catppuccin.nixosModules.catppuccin

          ./${host.name}/assets/assets.nix
          ./${host.name}/hardware.nix
          ./${host.name}/misc.nix
          ./${host.name}/packages.nix
          ./${host.name}/programs.nix
          ./${host.name}/services.nix
          ./${host.name}/users.nix
          ./${host.name}/xdg/xdg.nix
        ];

        specialArgs = {
          inherit os;
          inherit host;
          inherit bootloader theme;
          inherit pkgsUnstable;
        };
      };
    };
  };
}
