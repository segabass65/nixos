{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    
    catppuccin = {
      url = "github:catppuccin/nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-unstable = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    home-manager-unstable,
    catppuccin,
    catppuccin-unstable,
    ...
  } @ inputs: {

    lib = {
      nixosSystem = {
        nixpkgs,
        hostName,
        pkgsSettings,
        specialArgs,
        ...
      }: nixpkgs.lib.nixosSystem {
        modules = [
          {
            imports = [ ./hosts/${hostName} ];
            networking = { inherit hostName; };
            nixpkgs = pkgsSettings;
          }
        ];

        specialArgs = {
          inherit inputs;
        } // (specialArgs);
      };

      homeManagerConfiguration = {
        home-manager,
        os,
        username
      }: home-manager.lib.homeManagerConfiguration {
        pkgs = os.pkgs;

        extraSpecialArgs = {
          osConfig = os.config;
        } // (os.config.home-manager.extraSpecialArgs);

        modules = [
          {
            imports = [
              ./hosts/${os.config.networking.hostName}/users/${username}
            ];

            home = { inherit username; };
          }
        ];
      };
    };

    nixosConfigurations = {
      pc = let
        pkgsSettings = {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
            permittedInsecurePackages = [
              "ventoy-1.1.10"
            ];
          };
        };

      in self.lib.nixosSystem {
        inherit nixpkgs pkgsSettings;
        
        hostName = "pc";

        specialArgs = {
          pkgsUnstable = import nixpkgs-unstable pkgsSettings;
        };
      };

      srv = let
        pkgsSettings = {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

      in self.lib.nixosSystem {
        inherit nixpkgs pkgsSettings;
        
        hostName = "srv";

        specialArgs = {
          pkgsUnstable = import nixpkgs-unstable pkgsSettings;
        };
      };
    };

    homeConfigurations = {
      "segabass65@pc" = self.lib.homeManagerConfiguration {
        inherit home-manager;

        os = self.nixosConfigurations.pc;
        username = "segabass65";
      };

      "segabass65@srv" = self.lib.homeManagerConfiguration {
        inherit home-manager;

        os = self.nixosConfigurations.srv;
        username = "segabass65";
      };
    };
  };
}
