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
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    catppuccin,
    ...
  }: {

    nixosConfigurations = {
      main = let
        hostName = "main";
        platform = {
          name = "x86_64-linux";
          isNixos = true;
        };

        theme = "mocha";

        pkgsSettings = {
          system = platform.name;
          config = {
            allowUnfree = true;
            permittedInsecurePackages = [
              "librewolf-bin-148.0-1"
              "librewolf-bin-unwrapped-148.0-1"
              "ventoy-qt5-1.1.10"
            ];
          };
        };
        
        pkgsUnstable = import nixpkgs-unstable pkgsSettings;

      in nixpkgs.lib.nixosSystem {
        modules = [
          {
            imports = [
              ./hosts
              catppuccin.nixosModules.catppuccin
              home-manager.nixosModules.home-manager
            ];

            home-manager = {
              extraSpecialArgs = {
                inherit platform;
                inherit pkgsUnstable;
              };
              useGlobalPkgs = true;
              users = {
                segabass65 = {
                  _module.args.username = "segabass65";
                  
                  imports = [
                    ./users/segabass65
                  ];
                };
              };
              useUserPackages = true;
            };

            nixpkgs.config = pkgsSettings.config;
          }
        ];

        specialArgs = {
          inherit hostName platform;
          inherit theme;
          inherit pkgsUnstable;
        };
      };
    };

    homeConfigurations = {
      segabass65 = let
        username = "segabass65";
        platform = {
          name = "x86_64-linux";
          isNixos = false;
        };

        pkgsSettings = {
          system = platform.name;
          config.allowUnfree = true;
        };

        pkgsStable = import nixpkgs pkgsSettings;
        pkgsUnstable = import nixpkgs-unstable pkgsSettings;

      in home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit username platform;
          inherit pkgsUnstable;
        };

        modules = [
          ./users/${username}
        ];

        pkgs = pkgsStable;
      };
    };
  };
}
