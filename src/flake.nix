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
              ./users/${username}
            ];

            home = { inherit username; };
          }
        ];
      };
    };

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
              ./hosts/${hostName}
            ];

            networking = { inherit hostName; };
            nixpkgs = pkgsSettings;
          }
        ];

        specialArgs = {
          inherit inputs;
          inherit pkgsUnstable;
        };
      };
    };

    homeConfigurations = {
      segabass65 = self.lib.homeManagerConfiguration {
        inherit home-manager;

        os = self.nixosConfigurations.pc;
        username = "segabass65";
      };
    };
  };
}
