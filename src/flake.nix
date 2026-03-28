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
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    catppuccin = {
      url = "github:catppuccin/nix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-unstable = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
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
      nixos = {
        dir = hostName: ./hosts/${hostName};

        system = {
          nixpkgs,
          hostName,
          pkgsSettings,
          specialArgs,
          ...
        }: nixpkgs.lib.nixosSystem {
          modules = [
            {
              imports = [ (self.lib.nixos.dir hostName) ];
              networking = { inherit hostName; };
              nixpkgs = pkgsSettings;
            }
          ];

          specialArgs = {
            inherit inputs;
          } // (specialArgs);
        };
      };

      homeManager = {
        dir = username: ./users/${username};

        config = {
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
              imports = [ (self.lib.homeManager.dir username) ];
              home = { inherit username; };
            }
          ];
        };
      };
    };

    nixosConfigurations = {
      pc = let
        pkgsSettings = {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
            permittedInsecurePackages = [
              "ventoy-qt5-1.1.10"
            ];
          };
        };

      in self.lib.nixos.system {
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

      in self.lib.nixos.system {
        inherit nixpkgs pkgsSettings;
        
        hostName = "srv";

        specialArgs = {
          pkgsUnstable = import nixpkgs-unstable pkgsSettings;
        };
      };
    };

    homeConfigurations = {
      "segabass65@pc" = self.lib.homeManager.config {
        inherit home-manager;

        os = self.nixosConfigurations.pc;
        username = "segabass65";
      };

      "segabass65@srv" = self.lib.homeManager.config {
        inherit home-manager;

        os = self.nixosConfigurations.srv;
        username = "segabass65";
      };
    };
  };
}
