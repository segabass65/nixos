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
      pc = let
        hostName = "pc";

        pkgsSettings = {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
            permittedInsecurePackages = [
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
              extraSpecialArgs.pkgsUnstable = pkgsUnstable;
              useGlobalPkgs = true;

              users = {
                segabass65 = {
                  _module.args.username = "segabass65";
                  
                  imports = [
                    ./users/segabass65
                    catppuccin.homeModules.catppuccin
                  ];
                };
              };

              useUserPackages = true;
            };

            nixpkgs = pkgsSettings;
          }
        ];

        specialArgs = {
          inherit hostName pkgsUnstable;
        };
      };
    };

    homeConfigurations = {
      segabass65 = let
        username = "segabass65";

        pkgsSettings = {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        pkgs = import nixpkgs pkgsSettings;
        pkgsUnstable = import nixpkgs-unstable pkgsSettings;

      in home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit username pkgsUnstable;
        };

        modules = [
          ./users/${username}
          catppuccin.homeModules.catppuccin
        ];
      };
    };
  };
}
